//
//  ButtonToggle.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

public struct ButtonToggle: View {
    public enum Style {
        case normal, glass
    }
    
    let titleKey: LocalizedStringKey
    let action: () -> Void
    let showRightIcon: Bool
    let font: Font
    let style: Style
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text(titleKey)
                    .foregroundStyle(.foreground(.primary))
                if showRightIcon {
                    Image(systemName: "chevron.down")
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .font(font)
        }
        .buttonStyle(.plain)
        .background {
            if style == .glass {
                RoundedRectangle(cornerRadius: 99)
                    .fill(.container(.background))
                    .stroke(.container(.border), lineWidth: 1)
            }
        }
    }
    
    public init(_ titleKey: LocalizedStringKey, style: Style = .normal, showRightIcon: Bool = true, font: Font = .captionMedium, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.action = action
        self.showRightIcon = showRightIcon
        self.font = font
        self.style = style
    }
}

#Preview {
    VStack(spacing: 20) {
        ButtonToggle("Menu") {}
        ButtonToggle("Menu", style: .glass) {}
    }
    .padding(20)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.light)
}

#Preview {
    VStack(spacing: 20) {
        ButtonToggle("Menu") {}
        ButtonToggle("Menu", style: .glass) {}
    }
    .padding(20)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.dark)
}
