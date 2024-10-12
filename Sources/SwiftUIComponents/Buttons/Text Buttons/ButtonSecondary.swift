//
//  ButtonSecondary.swift
//
//
//  Created by Jiafu Zhang on 6/15/24.
//

import SwiftUI

public struct ButtonSecondary<Icon: View>: View {
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
        
        var spacing: CGFloat {
            switch self {
            case .small, .medium:
                8
            case .large, .extraLarge:
                12
            }
        }
    }
    
    private let icon: Icon
    private let title: LocalizedStringKey
    private let size: Size
    
    public var body: some View {
        HStack(spacing: size.spacing) {
            Text(title)
                .padding(.vertical, 1)
            icon
        }
        .font(size.font)
        .foregroundStyle(.foreground(.primary))
        .padding(.vertical, size.verticalPadding)
        .padding(.horizontal, size.horizontalPadding)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(colors: [.white, .white.opacity(0.5)], startPoint: .top, endPoint: .bottom))
                .opacity(0.1)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
        .shadowBlur(.small)
    }
    
    public init(_ size: Size, title: LocalizedStringKey, @ViewBuilder icon: () -> Icon) {
        self.size = size
        self.title = title
        self.icon = icon()
    }
}

struct ButtonSecondaryView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            ButtonSecondary(.small, title: "Secondary") {
                Image(systemName: "envelope.open")
            }
            ButtonSecondary(.medium, title: "Secondary") {
                Image(systemName: "envelope.open")
            }
            ButtonSecondary(.large, title: "Secondary") {
                Image(systemName: "envelope.open")
            }
            ButtonSecondary(.extraLarge, title: "Secondary") {
                Image(systemName: "envelope.open")
            }
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        ButtonSecondaryView()
            .environment(\.colorScheme, .light)
        ButtonSecondaryView()
            .environment(\.colorScheme, .dark)
    }
    .frame(width: 598)
    .padding(10)
    .padding(60)
}
