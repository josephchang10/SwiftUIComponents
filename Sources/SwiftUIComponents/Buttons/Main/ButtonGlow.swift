//
//  SwiftUIView.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct ButtonGlow<Icon: View>: View {
    public enum Size {
        case small
        case medium
        case large
        case extraLarge
        
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
    }
    
    private let borderWidth: CGFloat
    private let icon: Icon
    private let text: LocalizedStringKey
    private let showGlow: Bool
    private let size: Size
    
    public var body: some View {
        HStack(spacing: 8) {
            Text(text)
                .padding(.vertical, 1)
            icon
        }
        .font(size.font)
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .background {
            if showGlow {
                glow
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.container(.background))
                .fill(.thinMaterial)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
//                .inset(by: borderWidth / 2)
                .strokeBorder(.container(.border), lineWidth: borderWidth)
        }
        .shadowBlur(.small)
        .background {
            if showGlow {
                backgroundGlow
            }
        }
        .overlay {
            if showGlow {
                outline
            }
        }
    }
    
    var backgroundGlow: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.angular1)
//            .blur(radius: .point(20))
            .blur(radius: 20)
            .opacity(0.8)
            .blendMode(.screen)
    }
    
    var glow: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.angular1)
            .blur(radius: .point(20))
            .opacity(0.2)
            .blendMode(.screen)
    }
    
    var outline: some View {
        RoundedRectangle(cornerRadius: 8)
            .inset(by: borderWidth / 2)
            .stroke(
                LinearGradient(colors: [.white, .white.opacity(0.5)], startPoint: .top, endPoint: .bottom), lineWidth: borderWidth
                )
            .blendMode(.overlay)
    }
    
    public init(_ size: Size, text: LocalizedStringKey, showGlow: Bool = true, borderWidth: CGFloat = 1, @ViewBuilder icon: () -> Icon) {
        self.size = size
        self.text = text
        self.showGlow = showGlow
        self.icon = icon()
        self.borderWidth = borderWidth
    }
}

struct ButtonGlowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            ButtonGlow(.small, text: "Glow") {
                Image(systemName: "chevron.right")
            }
            ButtonGlow(.medium, text: "Glow") {
                Image(systemName: "chevron.right")
            }
            ButtonGlow(.large, text: "Glow") {
                Image(systemName: "chevron.right")
            }
            ButtonGlow(.extraLarge, text: "Glow") {
                Image(systemName: "chevron.right")
            }
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        ButtonGlowView()
            .environment(\.colorScheme, .light)
        ButtonGlowView()
            .environment(\.colorScheme, .dark)
    }
    .padding(10)
    .padding(60)
//    .background(.container(.background))
    .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
}
