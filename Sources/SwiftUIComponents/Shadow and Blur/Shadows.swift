//
//  Shadows.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

public struct ShadowBlur: ViewModifier {
    public enum Size {
        case small
        case medium
        case large
        case extraLarge
    }
    
    let size: Size
    
    public func body(content: Content) -> some View {
        switch size {
        case .small:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.05), radius: 0, y: 1)
                .shadow(color: .black.opacity(0.05), radius: 4, y: 4)
                .shadow(color: .black.opacity(0.1), radius: 10, y: 10)
        case .medium:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                .shadow(color: .black.opacity(0.15), radius: 30, y: 15)
        case .large:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 6, y: 3)
                .shadow(color: .black.opacity(0.1), radius: 20, y: 10)
                .shadow(color: .black.opacity(0.15), radius: 30, y: 15)
        case .extraLarge:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                .shadow(color: .black.opacity(0.1), radius: 30, y: 15)
                .shadow(color: .black.opacity(0.15), radius: 40, y: 20)
        }
    }
    
    public init(_ size: Size) {
        self.size = size
    }
}

public extension ViewModifier where Self == ShadowBlur {
    static func shadowBlur(_ size: ShadowBlur.Size) -> Self {
        .init(size)
    }
}

public extension View {
    func shadowBlur(_ size: ShadowBlur.Size) -> some View {
        modifier(ShadowBlur(size))
    }
}

public struct ShadowBlurStrong: ViewModifier {
    public enum Size {
        case small
        case medium
        case large
        case extraLarge
    }
    
    let size: Size
    
    public func body(content: Content) -> some View {
        switch size {
        case .small:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.05), radius: 0, y: 1)
                .shadow(color: .black.opacity(0.1), radius: 4, y: 4)
                .shadow(color: .black.opacity(0.15), radius: 10, y: 10)
        case .medium:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                .shadow(color: .black.opacity(0.2), radius: 20, y: 10)
        case .large:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 6, y: 3)
                .shadow(color: .black.opacity(0.15), radius: 20, y: 10)
                .shadow(color: .black.opacity(0.2), radius: 30, y: 15)
        case .extraLarge:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
                .shadow(color: .black.opacity(0.15), radius: 30, y: 15)
                .shadow(color: .black.opacity(0.25), radius: 40, y: 20)
        }
    }
    
    public init(_ size: Size) {
        self.size = size
    }
}

public extension ViewModifier where Self == ShadowBlurStrong {
    static func shadowBlurStrong(_ size: ShadowBlurStrong.Size) -> Self {
        .init(size)
    }
}

public extension View {
    func shadowBlurStrong(_ size: ShadowBlurStrong.Size) -> some View {
        modifier(ShadowBlurStrong(size))
    }
}

public struct ShadowBlurSubtle: ViewModifier {
    public enum Size {
        case small
        case medium
        case large
        case extraLarge
    }
    
    let size: Size
    
    public func body(content: Content) -> some View {
        switch size {
        case .small:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.03), radius: 1, y: 1)
                .shadow(color: .black.opacity(0.1), radius: 2)
                .shadow(color: .black.opacity(0.03), radius: 5, y: 5)
        case .medium:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.03), radius: 2, y: 1)
                .shadow(color: .black.opacity(0.05), radius: 4, y: 4)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 8)
        case .large:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.03), radius: 0, y: 1)
                .shadow(color: .black.opacity(0.05), radius: 6, y: 6)
                .shadow(color: .black.opacity(0.05), radius: 10, y: 10)
        case .extraLarge:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.03), radius: 0, y: 1)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 8)
                .shadow(color: .black.opacity(0.06), radius: 12, y: 12)
        }
    }
    
    public init(_ size: Size) {
        self.size = size
    }
}

public extension ViewModifier where Self == ShadowBlurSubtle {
    static func shadowBlurSubtle(_ size: ShadowBlurSubtle.Size) -> Self {
        .init(size)
    }
}

public extension View {
    func shadowBlurSubtle(_ size: ShadowBlurSubtle.Size) -> some View {
        modifier(ShadowBlurSubtle(size))
    }
}

struct ShadowsView: View {
    var body: some View {
        HStack(spacing: 30) {
            VStack(spacing: 30) {
                ButtonPrimary(.medium, shadow: .shadowBlurSubtle(.small)) {
                    Text("subtle sm")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
                ButtonPrimary(.medium, shadow: .shadowBlurSubtle(.medium)) {
                    Text("subtle md")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
                ButtonPrimary(.medium, shadow: .shadowBlurSubtle(.large)) {
                    Text("subtle lg")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
                ButtonPrimary(.medium, shadow: .shadowBlurSubtle(.extraLarge)) {
                    Text("subtle xl")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
            }
            VStack(spacing: 30) {
                ButtonPrimary(.medium, shadow: .shadowBlur(.small)) {
                    Text("regular sm")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
                ButtonPrimary(.medium, shadow: .shadowBlur(.medium)) {
                    Text("regular md")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
                ButtonPrimary(.medium, shadow: .shadowBlur(.large)) {
                    Text("regular lg")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
                ButtonPrimary(.medium, shadow: .shadowBlur(.extraLarge)) {
                    Text("regular xl")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
            }
            VStack(spacing: 30) {
                ButtonPrimary(.medium, shadow: .shadowBlurStrong(.small)) {
                    Text("strong sm")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
                ButtonPrimary(.medium, shadow: .shadowBlurStrong(.medium)) {
                    Text("strong md")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
                ButtonPrimary(.medium, shadow: .shadowBlurStrong(.large)) {
                    Text("strong lg")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
                ButtonPrimary(.medium, shadow: .shadowBlurStrong(.extraLarge)) {
                    Text("strong xl")
                        .frame(width: 74)
                } icon: {
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}

#Preview {
    ShadowsView()
        .frame(width: 512, height: 512)
        .background {
            Wave1()
                .frame(width: 1440, height: 1024)
            Grid1()
                .frame(width: 1440, height: 1024)
        }
        .background(alignment: .top) {
            Blur5()
                .frame(width: 1440, height: 1607)
                .offset(y: -931)
        }
        .preferredColorScheme(.light)
}
