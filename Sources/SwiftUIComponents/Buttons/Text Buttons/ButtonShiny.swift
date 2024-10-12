//
//  ButtonShiny.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct ButtonShiny<LeftIcon: View, RightIcon: View>: View {
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
    
    let size: Size
    let titleKey: LocalizedStringKey
    let leftIcon: LeftIcon?
    let rightIcon: RightIcon?
    
    public var body: some View {
        ZStack {
            HStack(spacing: size.spacing) {
                leftIcon
                    .frame(width: 16, height: 16)
                Text(titleKey)
                rightIcon
                    .frame(width: 16, height: 16)
            }
            .font(size.font)
            .foregroundStyle(.foreground(.primary))
            .padding(.horizontal, size.horizontalPadding)
            .padding(.vertical, size.verticalSpacing)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.regularMaterial)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 1)
                    .stroke(.container(.border), lineWidth: 2)
                    .stroke(.white.opacity(0.07), lineWidth: 2)
            }
            .shadowBlur(.small)
            .background {
                glow
            }
        }
    }
    
    var glow: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Angular1())
            .padding(-10)
            .opacity(0.3)
            .blur(radius: 20)
    }
    
    public init(_ size: Size, titleKey: LocalizedStringKey, @ViewBuilder rightIcon: () -> RightIcon) where LeftIcon == EmptyView {
        self.titleKey = titleKey
        self.size = size
        self.leftIcon = nil
        self.rightIcon = rightIcon()
    }
    
    public init(_ size: Size, titleKey: LocalizedStringKey, @ViewBuilder leftIcon: () -> LeftIcon, @ViewBuilder rightIcon: () -> RightIcon) {
        self.titleKey = titleKey
        self.size = size
        self.leftIcon = leftIcon()
        self.rightIcon = rightIcon()
    }
}

struct ButtonShinyView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            ButtonShiny(.small, titleKey: "Shiny") {
                Image(systemName: "chevron.right")
            }
            ButtonShiny(.medium, titleKey: "Shiny") {
                Image(systemName: "chevron.right")
            }
            ButtonShiny(.large, titleKey: "Shiny") {
                Image(systemName: "chevron.right")
            }
            ButtonShiny(.extraLarge, titleKey: "Shiny") {
                Image(systemName: "chevron.right")
            }
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        ButtonShinyView()
            .environment(\.colorScheme, .light)
        ButtonShinyView()
            .environment(\.colorScheme, .dark)
    }
    .padding(40)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
