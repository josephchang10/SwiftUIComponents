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
        case .tertiary:
            named("Foreground Tertiary")
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
    case tertiary
}

public extension ShapeStyle where Self == Color {
    static func foreground(_ colorStyle: ForegroundColorStyle) -> Self {
        .foreground(colorStyle)
    }
}

public enum BackgroundColorStyle {
    case secondary
    case blue
}

public extension ShapeStyle where Self == Color {
    static func background(_ colorStyle: BackgroundColorStyle) -> Self {
        switch colorStyle {
        case .secondary:
            Color("Background Secondary", bundle: .module)
        case .blue:
            Color(red: 6 / 255, green: 7 / 255, blue: 21 / 255)
        }
    }
}

public struct ContainerDivider: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var color: Color {
        colorScheme == .dark ? .white : .black
    }
    
    public var body: some View {
        EllipticalGradient(colors:[color.opacity(0.2), color.opacity(0)])
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
            Circle()
                .fill(.foreground(.primary))
                .stroke(.container(.divider), lineWidth: 1)
            
            Circle()
                .fill(.foreground(.secondary))
                .stroke(.container(.divider), lineWidth: 1)
            
            Circle()
                .fill(.foreground(.tertiary))
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
                .stroke(.container(.divider), lineWidth: 1)
                .overlay {
                    ContainerDivider()
                        .clipShape(Circle())
                }
        }
        .padding(40)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    VStack(spacing: 20) {
        ColorStyles()
            .environment(\.colorScheme, .light)
    }
    .padding()
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}

#Preview {
    VStack(spacing: 20) {
        ColorStyles()
            .environment(\.colorScheme, .dark)
    }
    .padding()
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
