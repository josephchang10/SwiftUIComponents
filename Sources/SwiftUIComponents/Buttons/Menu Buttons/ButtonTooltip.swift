//
//  Tooltip.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct ButtonTooltip: View {
    public enum Size {
        case small, medium, large, extraLarge
    }
    
    public enum _State {
        case normal
        case selected
    }
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var isHovering = false
    
    let state: _State
    let leftIcon: AnyView?
    let rightIcon: AnyView?
    let text: LocalizedStringKey
    
    public var body: some View {
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
                LinearGradient(colors: [.white.opacity(0.02), .white.opacity(colorScheme == .dark ? 0.1 : 0.5)], startPoint: .top, endPoint: .bottom)
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
        .onHover { hovering in
            withAnimation {
                isHovering = hovering
            }
        }
    }
    
    public init(_ size: Size, text: LocalizedStringKey, state: _State = .normal, @ViewBuilder leftIcon: () -> some View) {
        self.text = text
        self.state = state
        self.leftIcon = AnyView(leftIcon())
        self.rightIcon = nil
    }
    
    public init(_ size: Size, text: LocalizedStringKey, state: _State = .normal, @ViewBuilder leftIcon: () -> some View, @ViewBuilder rightIcon: () -> some View) {
        self.text = text
        self.state = state
        self.leftIcon = AnyView(leftIcon())
        self.rightIcon = AnyView(rightIcon())
    }
}

#Preview {
    VStack {
        ButtonTooltip(.small, text: "Tooltip") {
            Image(systemName: "folder")
        }
        ButtonTooltip(.small, text: "Tooltip", state: .selected) {
            Image(systemName: "folder")
        }
    }
    .padding()
}
