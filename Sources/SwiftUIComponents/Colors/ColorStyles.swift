//
//  ColorStyles.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

public extension Color {
    static func foreground(_ colorStyle: ForegroundColorStyle) -> Self {
        switch colorStyle {
        case .primary:
            named("Foreground Primary")
        case .secondary:
            named("Foreground Secondary")
        }
    }
    
    // Helper function to get the Color from assets
    private static func named(_ name: String) -> Color {
        #if canImport(AppKit)
        .init(nsColor: NSColor(named: name, bundle: .module)!)
        #else
        .init(uiColor: UIColor(named: name, in: .module, compatibleWith: nil)!)
        #endif
    }
}

public enum ContainerColorStyle {
    case background
    case border
    case divider
}

public enum ForegroundColorStyle {
    case primary
    case secondary
}

public extension ShapeStyle where Self == Color {
    static func foreground(_ colorStyle: ForegroundColorStyle) -> Self {
        .foreground(colorStyle)
    }
}

public enum BackgroundColorStyle {
    case secondary
}

public extension ShapeStyle where Self == Color {
    static func background(_ colorStyle: BackgroundColorStyle) -> Self {
        switch colorStyle {
        case .secondary:
            Color("Background Secondary", bundle: .module).opacity(0.1)
        }
    }
}

public struct ContainerDivider: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var color: Color {
        colorScheme == .dark ? .white : .black
    }
    
    public var body: some View {
        GeometryReader { proxy in
            RadialGradient(colors: [color.opacity(0.2), color.opacity(0)], center: .center, startRadius: 0, endRadius: Swift.max(proxy.size.width, proxy.size.height) / 2)
        }
    }
    
    public init() {}
}

public struct ContainerBorder: View {
    @Environment(\.colorScheme) var colorScheme
    
    public var body: some View {
        ZStack {
            switch colorScheme {
            case .dark:
                LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .init(x: 2.5, y: -1), endPoint: .init(x: 0.1, y: 0.5))
                Color.white.opacity(0.07)
            default:
                LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .init(x: 2.5, y: -1), endPoint: .init(x: 0.1, y: 0.5))
                Color.white.opacity(0.1)
            }
        }
    }
    
    public init() {}
}

struct ContainerBackground: ShapeStyle {
    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        switch environment.colorScheme {
        case .dark:
            AnyShapeStyle(Color.black.opacity(0.5))
        default:
            AnyShapeStyle(LinearGradient(colors: [.white.opacity(0.6), .white.opacity(0.5)], startPoint: .top, endPoint: .bottom))
        }
    }
}

struct ContainerDividerShapeStyle: ShapeStyle {
    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        let color = environment.colorScheme == .dark ? Color.white : .black
        // Workaround as the radius of RadialGradient is uncertain
        return AngularGradient(colors: [color.opacity(0.1)], center: .center)
    }
}

struct ContainerBorderShapeStyle: ShapeStyle {
    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        // Workaround as two layers are not supported
        switch environment.colorScheme {
        case .dark:
            LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .init(x: 1, y: -3), endPoint: .init(x: 0.5, y: 0.5))
        default:
            LinearGradient(colors: [.white, .white.opacity(0.1)], startPoint: .init(x: 1, y: -0.5), endPoint: .init(x: 0, y: 0.4))
        }
    }
}

public extension ShapeStyle where Self == AnyShapeStyle {
    static func container(_ colorStyle: ContainerColorStyle) -> Self {
        switch colorStyle {
        case .background:
            AnyShapeStyle(ContainerBackground())
        case .border:
            AnyShapeStyle(ContainerBorderShapeStyle())
        case .divider:
            AnyShapeStyle(ContainerDividerShapeStyle())
        }
    }
}

struct ColorStyles: View {
    var body: some View {
        HStack(spacing: 20) {
            Group {
                Circle()
                    .fill(.foreground(.primary))
                    .stroke(.container(.divider), lineWidth: 1)
                
                Circle()
                    .fill(.container(.background))
                    .stroke(.container(.divider), lineWidth: 1)
                
                Circle()
                    .stroke(.container(.divider), lineWidth: 1)
                    .overlay {
                        ContainerBorder()
                            .clipShape(Circle())
                    }
                
                Circle()
                    .fill(.container(.border))
                    .stroke(.container(.divider), lineWidth: 1)
                
                Circle()
                    .stroke(.container(.divider), lineWidth: 1)
                    .overlay {
                        ContainerDivider()
                            .clipShape(Circle())
                    }
            }
        }
        .padding(20)
        .background(.background(.secondary))
        .frame(maxHeight: .infinity)
        .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    }
}

#Preview {
    ColorStyles()
        .preferredColorScheme(.light)
}

#Preview {
    ColorStyles()
        .preferredColorScheme(.dark)
}
