//
//  Tooltip.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct ButtonTooltip: View {
    public enum _State {
        case normal
        case selected
    }
    
    @State private var isHovering = false
    
    let state: _State
    let action: () -> Void
    let leftIcon: AnyView?
    let rightIcon: AnyView?
    let text: LocalizedStringKey
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let leftIcon {
                    leftIcon
                }
                Text(text)
                    .width(.full, alignment: .leading)
                if let rightIcon {
                    rightIcon
                }
            }
            .foregroundStyle(.foreground(.primary))
            .font(.captionMedium)
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .background {
                if state == .selected {
                    LinearGradient(colors: [.white.opacity(0.02), .white.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                if isHovering || state == .selected {
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .strokeBorder(.container(.divider), lineWidth: 1)
                }
            }
        }
        .buttonStyle(.plain)
        .onHover { hovering in
            isHovering = hovering
        }
    }
    
    public init(_ text: LocalizedStringKey, state: _State = .normal, @ViewBuilder leftIcon: () -> some View, action: @escaping () -> Void) {
        self.text = text
        self.state = state
        self.leftIcon = AnyView(leftIcon())
        self.rightIcon = nil
        self.action = action
    }
    
    public init(_ text: LocalizedStringKey, state: _State = .normal, @ViewBuilder leftIcon: () -> some View, @ViewBuilder rightIcon: () -> some View, action: @escaping () -> Void) {
        self.text = text
        self.state = state
        self.leftIcon = AnyView(leftIcon())
        self.rightIcon = AnyView(rightIcon())
        self.action = action
    }
}

#Preview {
    VStack {
        ButtonTooltip("Tooltip") {
            Image(systemName: "folder")
        } action: {}
        ButtonTooltip("Tooltip", state: .selected) {
            Image(systemName: "folder")
        } action: {}
    }
    .padding()
}
