//
//  IconCircle.swift
//
//
//  Created by Jiafu Zhang on 4/15/24.
//

import SwiftUI

public struct IconCircle<Icon: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let icon: Icon
    var background: AnyShapeStyle?
    var border: AnyShapeStyle?
    
    public var body: some View {
        icon
            .fontWeight(.medium)
            .foregroundStyle(.foreground(.primary))
            .padding(4)
            .background {
                Circle()
                    .fill(background ?? AnyShapeStyle(LinearGradient(colors: [
                        .white.opacity(0.02),
                        .white.opacity(colorScheme == .dark ? 0.1 : 0.5)
                    ], startPoint: .top, endPoint: .bottom)))
            }
            .overlay {
                Circle()
                    .inset(by: 0.5)
                    .strokeBorder(border ?? AnyShapeStyle((colorScheme == .dark ? Color.white : .black).opacity(0.1)), lineWidth: 1)
            }
    }
    
    public init(@ViewBuilder icon: () -> Icon) {
        self.icon = icon()
    }
    
    public init(background: some ShapeStyle, border: some ShapeStyle, @ViewBuilder icon: () -> Icon) {
        self.background = AnyShapeStyle(background)
        self.border = AnyShapeStyle(border)
        self.icon = icon()
    }
}

#Preview {
    HStack(spacing: 20) {
        IconCircle {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
                .fontWeight(.bold)
                .frame(width: 16, height: 16)
        }
        .environment(\.colorScheme, .light)
        IconCircle {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
                .fontWeight(.bold)
                .frame(width: 16, height: 16)
        }
        .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .background(Color(red: 53/255, green: 53/255, blue: 53/255))
}
