//
//  ButtonGhost.swift
//
//
//  Created by Jiafu Zhang on 6/7/24.
//

import SwiftUI

public struct ButtonGhost<Icon: View, TextView: View>: View {
    public enum Size {
        case small
        case medium
        case large
        case extraLarge
        
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
    }
    
    private let icon: Icon
    private var key: LocalizedStringKey?
    private var text: String?
    private var textView: TextView?
    private let size: Size
    
    public var body: some View {
        HStack(spacing: 8) {
            icon
            Group {
                if let key {
                    Text(key)
                }
                if let text {
                    Text(text)
                }
                if let textView {
                    textView
                }
            }
            .font(size.font)
        }
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .strokeBorder(.foreground(.primary), lineWidth: 1)
        }
    }
    
    public init(_ size: Size, text: LocalizedStringKey, @ViewBuilder icon: () -> Icon) where TextView == EmptyView {
        self.size = size
        self.key = text
        self.icon = icon()
    }
    
    public init(_ size: Size, text: String, @ViewBuilder icon: () -> Icon) where TextView == EmptyView {
        self.size = size
        self.text = text
        self.icon = icon()
    }
    
    public init(_ size: Size, @ViewBuilder text: () -> TextView, @ViewBuilder icon: () -> Icon) {
        self.size = size
        self.textView = text()
        self.icon = icon()
    }
}

struct ButtonGhostView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            ButtonGhost(.small, text: "Ghost") {
                Image(systemName: "play")
                    .fontWeight(.bold)
            }
            ButtonGhost(.medium, text: "Ghost") {
                Image(systemName: "play")
                    .fontWeight(.bold)
            }
            ButtonGhost(.large, text: "Ghost") {
                Image(systemName: "play")
                    .fontWeight(.bold)
            }
            ButtonGhost(.extraLarge, text: "Ghost") {
                Image(systemName: "play")
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        ButtonGhostView()
            .environment(\.colorScheme, .light)
        ButtonGhostView()
            .environment(\.colorScheme, .dark)
    }
    .padding(10)
    .padding(60)
    .background(.container(.background))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
