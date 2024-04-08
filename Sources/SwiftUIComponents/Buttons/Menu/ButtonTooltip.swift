//
//  Tooltip.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct ButtonTooltip: View {
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
            .font(.captionMedium)
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
        }
        .buttonStyle(.plain)
    }
    
    public init(_ text: LocalizedStringKey, @ViewBuilder leftIcon: () -> some View, action: @escaping () -> Void) {
        self.text = text
        self.leftIcon = AnyView(leftIcon())
        self.rightIcon = nil
        self.action = action
    }
    
    public init(_ text: LocalizedStringKey, @ViewBuilder leftIcon: () -> some View, @ViewBuilder rightIcon: () -> some View, action: @escaping () -> Void) {
        self.text = text
        self.leftIcon = AnyView(leftIcon())
        self.rightIcon = AnyView(rightIcon())
        self.action = action
    }
}

#Preview {
    ButtonTooltip("Tooltip") {
        Image(systemName: "folder")
    } action: {}
}
