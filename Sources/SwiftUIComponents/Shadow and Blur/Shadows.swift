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
                // Workaround: Background blur not supported in SwiftUI
//                .background {
//                    Rectangle()
//                        .fill(.ultraThinMaterial)
//                        .blur(radius: 20)
//                }
        case .medium:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                .shadow(color: .black.opacity(0.15), radius: 30, y: 15)
                // Workaround: Background blur not supported in SwiftUI
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                }
        case .large:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 6, y: 3)
                .shadow(color: .black.opacity(0.1), radius: 20, y: 10)
                .shadow(color: .black.opacity(0.15), radius: 30, y: 15)
                // Workaround: Background blur not supported in SwiftUI
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                }
        case .extraLarge:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                .shadow(color: .black.opacity(0.1), radius: 30, y: 15)
                .shadow(color: .black.opacity(0.15), radius: 40, y: 20)
                // Workaround: Background blur not supported in SwiftUI
//                .background {
//                    Rectangle()
//                        .fill(.ultraThinMaterial)
//                        .blur(radius: 20)
//                }
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
                // Workaround: Background blur not supported in SwiftUI
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                }
        case .medium:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                .shadow(color: .black.opacity(0.2), radius: 20, y: 10)
                // Workaround: Background blur not supported in SwiftUI
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                }
        case .large:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 6, y: 3)
                .shadow(color: .black.opacity(0.15), radius: 20, y: 10)
                .shadow(color: .black.opacity(0.2), radius: 30, y: 15)
                // Workaround: Background blur not supported in SwiftUI
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                }
        case .extraLarge:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
                .shadow(color: .black.opacity(0.15), radius: 30, y: 15)
                .shadow(color: .black.opacity(0.25), radius: 40, y: 20)
                // Workaround: Background blur not supported in SwiftUI
//                .background {
//                    Rectangle()
//                        .fill(.ultraThinMaterial)
//                        .blur(radius: 20)
//                }
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
                // Workaround: Background blur not supported in SwiftUI
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                }
        case .medium:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.03), radius: 2, y: 1)
                .shadow(color: .black.opacity(0.05), radius: 4, y: 4)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 8)
                // Workaround: Background blur not supported in SwiftUI
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                }
        case .large:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.03), radius: 0, y: 1)
                .shadow(color: .black.opacity(0.05), radius: 6, y: 6)
                .shadow(color: .black.opacity(0.05), radius: 10, y: 10)
                // Workaround: Background blur not supported in SwiftUI
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                }
        case .extraLarge:
            content
                .compositingGroup()
                .shadow(color: .black.opacity(0.03), radius: 0, y: 1)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 8)
                .shadow(color: .black.opacity(0.06), radius: 12, y: 12)
                // Workaround: Background blur not supported in SwiftUI
                .background {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 20)
                }
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
                ButtonPrimary(.medium, title: "subtle sm") {
                    Image(systemName: "chevron.right")
                }
                .shadowBlurSubtle(.small)
            }
             VStack(spacing: 30) {
                 ButtonPrimary(.small, title: "regular sm") {
                     Image(systemName: "chevron.right")
                 }
                .shadowBlur(.small)
            }
        }
    }
}

#Preview {
    ShadowsView()
        .frame(width: .point(1024), height: .point(1024))
        .background {
            Blur5(radius1: 300, radius2: 600)
                .frame(width: .point(1581), height: .point(1581))
                .offset(y: .point(-600))
            Wave1()
                .frame(width: .point(1440), height: .point(1024))
            Grid1()
                .frame(width: .point(1440), height: .point(1024))
        }
        .preferredColorScheme(.light)
}
