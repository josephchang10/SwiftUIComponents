//
//  ButtonShiny.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct ButtonShiny<Icon: View>: View {
    let action: () -> Void
    let titleKey: LocalizedStringKey
    let iconContent: Icon
    let showRightIcon: Bool
    let showLeftIcon: Bool
    
    public var body: some View {
        Button(action: action) {
            ZStack {
                HStack(spacing: 12) {
                    if showLeftIcon {
                        icon
                    }
                    Text(titleKey)
                    if showRightIcon {
                        icon
                    }
                }
                .font(.footnoteMedium)
                .foregroundStyle(.foreground(.primary))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.container(.background))
                        .stroke(.container(.border), lineWidth: 2)
                }
                .shadowBlur(.small)
                .background {
                    Rectangle()
                        .fill(Angular1())
                        .blur(radius: 20)
                    Rectangle()
                        .fill(Angular1())
                        .blur(radius: 20)
                        .opacity(0.3)
                        .blendMode(.screen)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    var icon: some View {
        iconContent
            .frame(width: 16, height: 16)
    }
    
    public init(_ titleKey: LocalizedStringKey, showLeftIcon: Bool = false, showRightIcon: Bool = true, @ViewBuilder icon: () -> Icon, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.action = action
        self.iconContent = icon()
        self.showLeftIcon = showLeftIcon
        self.showRightIcon = showRightIcon
    }
}

#Preview {
    ButtonShiny("Shiny") {
        Image(systemName: "chevron.right")
    } action: {}
        .padding()
        .background(.background(.secondary))
        .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
