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
    
    let text: LocalizedStringKey
    let showRightIcon: Bool
    let font: Font?
    let size: Size
    let state: State
    let style: Style
    
    public var body: some View {
        HStack(spacing: 8) {
            Text(text)
                .foregroundStyle(.foreground(.primary))
            if showRightIcon {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .font(font ?? size.font)
        .foregroundStyle(.foreground(.primary))
        .background {
            if state == .selected {
                RoundedRectangle(cornerRadius: 99)
                    .fill(.ultraThinMaterial)
                    .fill(.container(.background))
                    .shadowBlur(.small)
            }
        }
        .overlay {
            if state == .selected {
                RoundedRectangle(cornerRadius: 99)
                    .inset(by: 0.5)
                    .stroke(.container(.border), lineWidth: 1)
            }
        }
    }
    
    public init(_ size: Size, text: LocalizedStringKey, state: State = .normal, style: Style = .normal, showRightIcon: Bool = true, font: Font? = nil) {
        self.text = text
        self.showRightIcon = showRightIcon
        self.font = font
        self.size = size
        self.state = state
        self.style = style
    }
}

#Preview {
    VStack(spacing: 20) {
        HStack(spacing: 20) {
            ButtonToggle(.small, text: "Menu")
            ButtonToggle(.medium, text: "Menu")
            ButtonToggle(.large, text: "Menu")
            ButtonToggle(.extraLarge, text: "Menu")
        }
        HStack(spacing: 20) {
            ButtonToggle(.small, text: "Menu", state: .selected)
            ButtonToggle(.medium, text: "Menu", state: .selected)
            ButtonToggle(.large, text: "Menu", state: .selected)
            ButtonToggle(.extraLarge, text: "Menu", state: .selected)
        }
    }
    .padding(10)
    .padding(20)
    .background(.ultraThinMaterial)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.light)
}

#Preview {
    VStack(spacing: 20) {
        HStack(spacing: 20) {
            ButtonToggle(.small, text: "Menu")
            ButtonToggle(.medium, text: "Menu")
            ButtonToggle(.large, text: "Menu")
            ButtonToggle(.extraLarge, text: "Menu")
        }
        HStack(spacing: 20) {
            ButtonToggle(.small, text: "Menu", state: .selected)
            ButtonToggle(.medium, text: "Menu", state: .selected)
            ButtonToggle(.large, text: "Menu", state: .selected)
            ButtonToggle(.extraLarge, text: "Menu", state: .selected)
        }
    }
    .padding(10)
    .padding(20)
    .background(.ultraThinMaterial)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.dark)
}
