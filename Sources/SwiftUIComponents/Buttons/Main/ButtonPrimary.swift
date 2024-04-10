//
//  ButtonPrimary.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

public struct ButtonPrimary<Icon: View>: View {
    public enum Size {
        case small, medium, large, extraLarge
        
        var horizontalPadding: CGFloat {
            switch self {
            case .small:
                12
            case .medium, .large:
                16
            case .extraLarge:
                20
            }
        }
        
        var verticalPadding: CGFloat {
            switch self {
            case .small:
                4
            case .medium:
                6
            case .large:
                8
            case .extraLarge:
                10
            }
        }
        
        var font: Font {
            switch self {
            case .small, .medium:
                .captionMedium
            case .large:
                .footnoteMedium
            case .extraLarge:
                .bodyMedium
            }
        }
        
        var spacing: CGFloat {
            switch self {
            case .small, .medium:
                8
            case .large, .extraLarge:
                12
            }
        }
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    let size: Size
    let titleKey: LocalizedStringKey
    let icon: Icon
    let action: () -> Void
    
    private var base: some View {
        Button(action: action) {
            HStack(spacing: size.spacing) {
                Text(titleKey)
                icon
            }
            .foregroundStyle(.foreground(.primary))
            .font(size.font)
        }
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .buttonStyle(.plain)
    }
    
    public var body: some View {
        switch colorScheme {
        case .dark:
            base
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(.container(.border), lineWidth: 1)
                }
                .shadowBlur(.small)
        default:
            base
                .background(LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom).opacity(0.5)) // highlight
                .background(.ultraThinMaterial) // keep shadows from visible
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.45, y: 0.6)).opacity(0.5), lineWidth: 1)
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(.white.opacity(0.05), lineWidth: 1)
                }
                .shadowBlur(.small)
        }
        
    }
    
    public init(_ titleKey: LocalizedStringKey, _ size: Size, @ViewBuilder icon: () -> Icon, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.size = size
        self.icon = icon()
        self.action = action
    }
}

#Preview {
    VStack(spacing: 20) {
        ButtonPrimary("Primary", .small) { Image(systemName: "chevron.right") } action: {}
            .environment(\.colorScheme, .light)
        ButtonPrimary("Primary", .small) { Image(systemName: "chevron.right") } action: {}
            .environment(\.colorScheme, .dark)
    }
    .padding()
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
