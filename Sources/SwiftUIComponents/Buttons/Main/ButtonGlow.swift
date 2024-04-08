//
//  SwiftUIView.swift
//  
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct ButtonGlow<Icon: View>: View {
    let action: () -> Void
    let text: LocalizedStringKey
    let icon: Icon
    
    public var body: some View {
        Button(action: action) {
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
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .strokeBorder(.container(.border), lineWidth: 1)
            }
            .shadowBlur(.small)
        }
        .buttonStyle(.plain)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.angular1)
                .blur(radius: 20)
                .blendMode(.screen)
        }
    }
    
    public init(_ text: LocalizedStringKey, @ViewBuilder icon: () -> Icon, action: @escaping () -> Void) {
        self.action = action
        self.text = text
        self.icon = icon()
    }
}

#Preview {
    ButtonGlow("Glow") {
        Image(systemName: "arrow.right")
    } action: {}
        .environment(\.colorScheme, .light)
        .padding()
}
