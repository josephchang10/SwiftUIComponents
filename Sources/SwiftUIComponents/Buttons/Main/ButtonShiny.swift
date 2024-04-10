//
//  ButtonShiny.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct ButtonShiny<Icon: View>: View {
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
        
        var verticalSpacing: CGFloat {
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
    }
    
    let size: Size
    let action: () -> Void
    let titleKey: LocalizedStringKey
    let iconContent: Icon
    let showRightIcon: Bool
    let showLeftIcon: Bool
    
    public var body: some View {
        Button(action: action) {
            ZStack {
                HStack(spacing: size.spacing) {
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
                .padding(.horizontal, size.horizontalPadding)
                .padding(.vertical, size.verticalSpacing)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.regularMaterial)
                        .stroke(.container(.border), lineWidth: 2)
                }
                .shadowBlur(.small)
                .background {
                    glow
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    var icon: some View {
        iconContent
            .frame(width: 16, height: 16)
    }
    
    var glow: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Angular1())
            .padding(-10)
            .blur(radius: 20)
            .opacity(0.3)
    }
    
    public init(_ titleKey: LocalizedStringKey, _ size: Size, showLeftIcon: Bool = false, showRightIcon: Bool = true, @ViewBuilder icon: () -> Icon, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.size = size
        self.action = action
        self.iconContent = icon()
        self.showLeftIcon = showLeftIcon
        self.showRightIcon = showRightIcon
    }
}

#Preview {
    HStack(spacing: 10) {
        ButtonShiny("Shiny", .small) {
            Image(systemName: "chevron.right")
        } action: {}
        ButtonShiny("Shiny", .medium) {
            Image(systemName: "chevron.right")
        } action: {}
        ButtonShiny("Shiny", .large) {
            Image(systemName: "chevron.right")
        } action: {}
        ButtonShiny("Shiny", .extraLarge) {
            Image(systemName: "chevron.right")
        } action: {}
    }
    .padding()
    .background(.background(.secondary))
//    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
