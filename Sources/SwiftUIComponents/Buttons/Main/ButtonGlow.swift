//
//  SwiftUIView.swift
//  
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct ButtonGlow<Icon: View>: View {
    let text: LocalizedStringKey
    let icon: Icon
    let borderWidth: CGFloat
    
    public var body: some View {
        HStack(spacing: 8) {
            Text(text)
            icon
        }
        .font(.captionMedium)
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.container(.background))
                .fill(.ultraThinMaterial)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .inset(by: borderWidth / 2)
                .strokeBorder(.container(.border), lineWidth: borderWidth)
        }
        .shadowBlur(.small)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.angular1)
                .blur(radius: 20)
                .blendMode(.screen)
        }
    }
    
    public init(_ text: LocalizedStringKey, borderWidth: CGFloat = 1, @ViewBuilder icon: () -> Icon) {
        self.text = text
        self.icon = icon()
        self.borderWidth = borderWidth
    }
}

#Preview {
    ButtonGlow("Glow") {
        Image(systemName: "arrow.right")
    }
        .environment(\.colorScheme, .light)
        .padding()
}
