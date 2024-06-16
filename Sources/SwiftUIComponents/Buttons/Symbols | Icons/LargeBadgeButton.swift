//
//  LargeBadgeButton.swift
//
//
//  Created by Jiafu Zhang on 6/15/24.
//

import SwiftUI

public struct LargeBadgeButton<Icon: View>: View {
    private let icon: Icon
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: .point(16))
                .fill(.ultraThinMaterial)
                .frame(width: .point(64), height: .point(64))
                .rotationEffect(.degrees(45))
            RoundedRectangle(cornerRadius: .point(16))
                .fill(LinearGradient(stops: [
                    .init(color: .init(red: 40 / 255, green: 46 / 255, blue: 74 / 255, opacity: 0), location: 0),
                    .init(color: .init(red: 40 / 255, green: 82 / 255, blue: 153 / 255), location: 1)
                ], startPoint: .topLeading, endPoint: .bottomTrailing))
                .stroke(LinearGradient(stops: [
                    .init(color: .init(red: 39 / 255, green: 55 / 255, blue: 207 / 255).opacity(0), location: 0),
                    .init(color: .init(red: 189 / 255, green: 252 / 255, blue: 254 / 255), location: 1)
                ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                .stroke(Color(red: 39 / 255, green: 55 / 255, blue: 207 / 255, opacity: 0.5), lineWidth: 2)
                .frame(width: .point(64), height: .point(64))
                .rotationEffect(.degrees(45))
            RoundedRectangle(cornerRadius: .point(16))
                .stroke(LinearGradient(stops: [
                    .init(color: .init(red: 51 / 255, green: 66 / 255, blue: 1, opacity: 0), location: 0.49),
                    .init(color: .init(red: 55 / 255, green: 244 / 255, blue: 250 / 255), location: 1)
                ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: .point(4))
                .frame(width: .point(64), height: .point(64))
                .blur(radius: .point(2))
                .rotationEffect(.degrees(45))
            icon
                .padding(4)
        }
    }
    
    public init(@ViewBuilder content: () -> Icon) {
        self.icon = content()
    }
}

#Preview {
    LargeBadgeButton {
        Image(systemName: "plus")
            .fontWeight(.bold)
    }
    .padding(60)
    .background(.background(.gray))
}
