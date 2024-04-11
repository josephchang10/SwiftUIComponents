//
//  ButtonToggle.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

public struct ButtonToggle: View {
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
    }
    
    public enum State {
        case normal, selected
    }
    
    
    public enum Style {
        case normal, glass
    }
    
    let titleKey: LocalizedStringKey
    let action: () -> Void
    let showRightIcon: Bool
    let font: Font?
    let size: Size
    let state: State
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
            .padding(.horizontal, size.horizontalPadding)
            .padding(.vertical, size.verticalPadding)
            .font(font ?? size.font)
        }
        .buttonStyle(.plain)
        .background {
            if state == .selected {
                RoundedRectangle(cornerRadius: 99)
                    .fill(.container(.background))
                    .stroke(.container(.border), lineWidth: 1)
            }
        }
        .shadowBlur(.small)
    }
    
    public init(_ titleKey: LocalizedStringKey, _ size: Size, state: State = .normal, style: Style = .normal, showRightIcon: Bool = true, font: Font? = nil, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.action = action
        self.showRightIcon = showRightIcon
        self.font = font
        self.size = size
        self.state = state
        self.style = style
    }
}

#Preview {
    HStack(spacing: 10) {
        VStack(spacing: 20) {
            ButtonToggle("Menu", .small) {}
            ButtonToggle("Menu", .small, state: .selected) {}
        }
        VStack(spacing: 20) {
            ButtonToggle("Menu", .medium) {}
            ButtonToggle("Menu", .medium, state: .selected) {}
        }
        VStack(spacing: 20) {
            ButtonToggle("Menu", .large) {}
            ButtonToggle("Menu", .large, state: .selected) {}
        }
        VStack(spacing: 20) {
            ButtonToggle("Menu", .extraLarge) {}
            ButtonToggle("Menu", .extraLarge, state: .selected) {}
        }
    }
    .padding(10)
    .padding(20)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.light)
}

#Preview {
    VStack(spacing: 20) {
        ButtonToggle("Menu", .small) {}
        ButtonToggle("Menu", .small, state: .selected) {}
    }
    .padding(20)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.dark)
}
