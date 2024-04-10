//
//  ButtonGradient.swift
//
//
//  Created by Jiafu Zhang on 4/9/24.
//

import SwiftUI

public struct ButtonGradient<RightIcon: View>: View {
    public enum Size {
        case small, medium, large, extraLarge
        
        var spacing: CGFloat {
            switch self {
            case .small, .medium:
                8
            case .large, .extraLarge:
                12
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
                6
            case .medium:
                8
            case .large:
                10
            case .extraLarge:
                12
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
    }
    
    let text: LocalizedStringKey
    let action: () -> Void
    let size: Size
    let rightIcon: RightIcon
    
    public var body: some View {
        ZStack {
            HStack(spacing: size.spacing) {
                Text(text)
                rightIcon
            }
            .font(size.font)
            .foregroundStyle(.white)
            .padding(.horizontal, size.horizontalPadding)
            .padding(.vertical, size.verticalPadding)
            .background(alignment: .bottom) {
                Image("Angular", bundle: .module)
                    .resizable()
            }
            .clipShape(RoundedRectangle(cornerRadius: 100))
            .overlay {
                RoundedRectangle(cornerRadius: 100)
                    .inset(by: 0.5)
                    .strokeBorder(LinearGradient(colors: [.white, .white.opacity(0.4)], startPoint: .top, endPoint: .bottom), lineWidth: 1)
                    .blendMode(.overlay)
            }
        }
    }
    
    public init(_ text: LocalizedStringKey, _ size: Size, @ViewBuilder rightIcon: () -> RightIcon, action: @escaping () -> Void) {
        self.text = text
        self.rightIcon = rightIcon()
        self.size = size
        self.action = action
    }
}

#Preview {
    HStack(spacing: 10) {
        ButtonGradient("Get Started", .small) {
            Image(systemName: "chevron.right")
        } action: {}
        ButtonGradient("Get Started", .medium) {
            Image(systemName: "chevron.right")
        } action: {}
        ButtonGradient("Get Started", .large) {
            Image(systemName: "chevron.right")
        } action: {}
        ButtonGradient("Get Started", .extraLarge) {
            Image(systemName: "chevron.right")
        } action: {}
    }
    .padding(10)
}
