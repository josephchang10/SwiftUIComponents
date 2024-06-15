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
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        .init(nsColor: NSColor(named: name, bundle: .module)!)
        #else
        .init(uiColor: UIColor(named: name, in: .module, compatibleWith: nil)!)
        #endif
    }
}

public enum ContainerColorStyle {
    case background
    case border
    case borderSecondary
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
    case primary
    case secondary
    case blue
    case gray
}

public extension ShapeStyle where Self == Color {
    static func background(_ colorStyle: BackgroundColorStyle) -> Self {
        switch colorStyle {
        case .primary:
            Color("Background Primary", bundle: .module)
        case .secondary:
            Color("Background Secondary", bundle: .module)
        case .blue:
            Color("Background Blue", bundle: .module)
        case .gray:
            Color("Background Gray", bundle: .module)
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
        case .borderSecondary:
            AnyShapeStyle(.white.opacity(0.2))
        case .divider:
            AnyShapeStyle(ContainerDividerShapeStyle())
        }
    }
}

public enum ButtonColorStyle {
    case normal
    case inactive
}

public extension ShapeStyle where Self == Color {
    static func button(_ colorStyle: ButtonColorStyle) -> Self {
        switch colorStyle {
        case .normal:
            .init(red: 0, green: 122 / 255, blue: 1)
        case .inactive:
            .black.opacity(0.2)
        }
    }
}

public enum TextGradientStyle: Sendable {
    case secondary
}

struct TextGradientShapeStyle: ShapeStyle {
    private let style: TextGradientStyle
    
    init(style: TextGradientStyle) {
        self.style = style
    }
    
    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        switch style {
        case .secondary:
            switch environment.colorScheme {
            case .dark:
                LinearGradient(stops: [
                    .init(color: Color(red: 214 / 255, green: 222 / 255, blue: 1), location: 0),
                    .init(color: Color(red: 116 / 255, green: 126 / 255, blue: 181 / 255), location: 0.67),
                    .init(color: Color(red: 110 / 255, green: 66 / 255, blue: 145 / 255), location: 1)
                ], startPoint: .init(x: 0.8, y: 4), endPoint: .init(x: 0.4, y: -3.5))
            default:
                LinearGradient(stops: [
                    .init(color: .black, location: 0),
                    .init(color: Color(red: 77 / 255, green: 44 / 255, blue: 118 / 255), location: 0.45),
                    .init(color: Color(red: 59 / 255, green: 89 / 255, blue: 183 / 255), location: 1)
                ], startPoint: .init(x: 1.4, y: 1.2), endPoint: .init(x: 0.1, y: -0.2))
            }
        }
    }
}

public extension ShapeStyle where Self == AnyShapeStyle {
    static func textGradient(_ style: TextGradientStyle) -> Self {
        AnyShapeStyle(TextGradientShapeStyle(style: style))
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

public enum Gradients {
    case blue1
}

public extension ShapeStyle where Self == LinearGradient {
    static func gradients(_ gradients: Gradients) -> Self {
        switch gradients {
        case .blue1:
            LinearGradient(colors: [.init(red: 68 / 255, green: 0, blue: 155 / 255), .init(red: 35 / 255, green: 112 / 255, blue: 202 / 255)], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}
