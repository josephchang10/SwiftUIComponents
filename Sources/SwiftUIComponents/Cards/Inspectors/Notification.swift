//
//  Notification.swift
//
//
//  Created by Jiafu Zhang on 5/20/24.
//

import SwiftUI

public struct Notification<Buttons: View, Content: View>: View {
    private let buttons: Buttons
    private let content: Content
    private let titleText: LocalizedStringKey
    
    public var body: some View {
        VStack(spacing: 8) {
            title
            DividerLine()
            content
        }
        .padding(20)
        .background(.container(.background))
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
//                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
        .frame(minWidth: 260, maxWidth: 400)
        .shadowBlur(.extraLarge)
    }
    
    var title: some View {
        HStack(spacing: 8) {
            Text(titleText)
                .font(.footnoteMedium)
                .foregroundStyle(.foreground(.secondary))
                .width(.full, alignment: .leading)
            buttons
        }
    }
    
    public init(title: LocalizedStringKey, @ViewBuilder buttons: () -> Buttons, @ViewBuilder content: () -> Content) {
        self.buttons = buttons()
        self.content = content()
        self.titleText = title
    }
}

struct NotificationView: View {
    var body: some View {
        Notification(title: "Notifications") {
            ButtonCircle(.small) {
                Image(systemName: "house")
            }
            ButtonCircle(.small) {
                Image(systemName: "slider.horizontal.3")
            }
            AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1580489944761-15a19d654956?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
            } placeholder: {
                Color.clear
                    .frame(width: 24, height: 24)
            }
        } content: {
            Activity(title: "Alex Suprun", text: "prepared a report", time: .now.addingTimeInterval(-60 * 2)) {
                AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }
            Activity(title: "Stephanie Liverani", text: "invited you to a chat", time: .now.addingTimeInterval(-60 * 5)) {
                AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }
            Activity(title: "Nicolas Horn", text: "invited you to a meeting", time: .now.addingTimeInterval(-60 * 15)) {
                AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }
            Activity(.selected, title: "Alexander Hipp", text: "invited you to a meeting", time: .now.addingTimeInterval(-60 * 60 * 24)) {
                AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }
            DividerLine()
            HStack {
                Text("2 unread")
                    .font(.captionRegular)
                    .foregroundStyle(.foreground(.secondary))
                Spacer()
                ButtonPrimary(.small, title: "Mark all as read")
            }
        }
        .frame(width: 300)
    }
}

#Preview {
    HStack {
        NotificationView()
            .environment(\.colorScheme, .light)
        NotificationView()
            .environment(\.colorScheme, .dark)
    }
    .padding(60)
    //    .background(.container(.background))
    .background(Color(red: 53/255, green: 53/255, blue: 53/255))
}
