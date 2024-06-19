//
//  ButtonCheck.swift
//
//
//  Created by Jiafu Zhang on 4/15/24.
//

import SwiftUI

public struct ButtonCheck<Icon: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    private let icon: Icon
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(colors: [.white.opacity(0.02), .white.opacity(colorScheme == .dark ? 0.1 : 0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(5)
                .rotationEffect(.degrees(45))
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(.container(.divider), lineWidth: 1)
                .padding(5)
                .rotationEffect(.degrees(45))
            icon
                .font(.captionMedium)
                .foregroundStyle(.foreground(.primary))
                .padding(2)
                .frame(width: 16, height: 16)
        }
        .frame(width: 32, height: 32)
    }
    
    public init(@ViewBuilder icon: () -> Icon) {
        self.icon = icon()
    }
}

#Preview {
    HStack {
        ButtonCheck {
            Image(systemName: "checkmark")
                .resizable()
                .scaledToFit()
        }
        .environment(\.colorScheme, .light)
        ButtonCheck {
            Image(systemName: "checkmark")
                .resizable()
                .scaledToFit()
        }
        .environment(\.colorScheme, .dark)
    }
    .padding()
    .background(.container(.background))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
