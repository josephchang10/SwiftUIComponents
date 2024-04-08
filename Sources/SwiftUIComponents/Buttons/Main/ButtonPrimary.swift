//
//  ButtonPrimary.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

public struct ButtonPrimary<Icon: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    let titleKey: LocalizedStringKey
    let icon: Icon
    let action: () -> Void
    let font: Font
    
    private var base: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text(titleKey)
                icon
            }
            .foregroundStyle(.foreground(.primary))
            .font(font)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .buttonStyle(.plain)
    }
    
    public var body: some View {
        switch colorScheme {
        case .dark:
            base
                .background(.container(.background))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.container(.border), lineWidth: 1)
                }
                .shadowBlur(.small)
        default:
            base
                .background(LinearGradient(colors: [.white, .white.opacity(0.5)], startPoint: .top, endPoint: .bottom).opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.45, y: 0.6)).opacity(0.5), lineWidth: 1)
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white.opacity(0.05), lineWidth: 1)
                }
                .shadowBlur(.small)
        }
        
    }
    
    public init(_ titleKey: LocalizedStringKey, icon: Icon, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.icon = icon
        self.action = action
        self.font = .captionMedium
    }
}

#Preview {
    VStack(spacing: 20) {
        ButtonPrimary("Primary", icon: Image(systemName: "chevron.right")) {}
            .environment(\.colorScheme, .light)
        ButtonPrimary("Primary", icon: Image(systemName: "chevron.right")) {}
            .environment(\.colorScheme, .dark)
    }
    .padding()
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
