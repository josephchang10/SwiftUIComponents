//
//  MailList.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 11/4/24.
//

import SwiftUI

public struct MailList<ButtonList: View, Content: View>: View {
    private let buttonList: ButtonList
    private let content: Content
    
    public var body: some View {
        HStack(spacing: 24) {
            buttonList
            content
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(colors: [
                        .init(red: 17 / 255, green: 16 / 255, blue: 24 / 255, opacity: 0),
                        .init(red: 17 / 255, green: 16 / 255, blue: 24 / 255, opacity: 0.51),
                    ], startPoint: .init(x: 0, y: 0.7), endPoint: .init(x: 1.3, y: 0.75))
                )
                .stroke(.foreground(.primary).opacity(0.1), lineWidth: 1)
        }
    }
    
    public init(@ViewBuilder button buttonList: () -> ButtonList, @ViewBuilder content: () -> Content) {
        self.buttonList = buttonList()
        self.content = content()
    }
}

#Preview {
    MailList {
        Image(systemName: "righttriangle")
            .fontWeight(.bold)
            .rotationEffect(.degrees(-135))
            .offset(y: 3)
            .frame(width: 46, height: 46)
            .background {
                Circle()
                    .fill(.button(.normal))
            }
            .overlay {
                Circle()
                    .inset(by: 0.5)
                    .stroke(.container(.border), lineWidth: 1)
            }
    } content: {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                HStack(spacing: 10) {
                    Text("Live Session Reminder")
                        .font(.bodyMedium)
                    Circle()
                        .fill(.button(.normal))
                        .frame(width: 6, height: 6)
                }
                Spacer()
                Text("24m")
                    .font(.footnoteRegular)
                    .foregroundStyle(.foreground(.secondary))
            }
            Text("Don't Miss Out! Join the live session with your instructor tomorrow at 9 AM.")
                .font(.footnoteRegular)
                .foregroundStyle(.foreground(.secondary))
        }
    }
    .frame(width: 400)
    .padding(20)
    .padding(60)
    .background(Color.background(.secondary).environment(\.colorScheme, .light))
    .background(Color(red: 30/255, green: 30/255, blue: 30/255))
    .preferredColorScheme(.dark)
}
