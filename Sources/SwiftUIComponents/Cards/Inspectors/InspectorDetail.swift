//
//  InspectorDetail.swift
//
//
//  Created by Jiafu Zhang on 5/10/24.
//

import SwiftUI

public struct InspectorDetail<Content: View>: View {
    private let content: Content
    
    public var body: some View {
        VStack(spacing: 20) {
            content
        }
        .padding(20)
        .background(.container(.background))
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
        .shadowBlur(.small)
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

public struct InspectorDetailView: View {
    public var body: some View {
        HStack(spacing: 20) {
            inspectorDetail
            inspectorDetail
                .environment(\.colorScheme, .dark)
        }
        .padding(20)
        .padding(60)
        .background(.background(.secondary))
        .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    }
    
    var inspectorDetail: some View {
        InspectorDetail {
            VStack(spacing: 16) {
                HStack {
                    Text("Balance")
                        .foregroundStyle(.foreground(.secondary))
                    Spacer()
                    Image(systemName: "plus")
                }
                .font(.bodyMedium)
                .width(.full)
                BankCard(.card2, number: "****   ****   ****   2859", validThru: "Valid thru 06/24", notchLabel: "CREDIT CARD") {
                    CompanyLogo(.mastercard)
                }
                .shadowBlurStrong(.extraLarge)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(.container(.border), lineWidth: 1)
                }
                VStack(alignment: .leading, spacing: 9) {
                    Text("Card details")
                        .font(.bodyMedium)
                    HStack {
                        Text("Card number")
                            .font(.captionMedium)
                        Spacer()
                        Text("****")
                            .font(.captionRegular)
                    }
                    HStack {
                        Text("Balance")
                            .font(.captionMedium)
                        Spacer()
                        Text("$28,678.65")
                            .font(.captionRegular)
                    }
                    HStack {
                        Text("Currency")
                            .font(.captionMedium)
                        Spacer()
                        Text("USD")
                            .font(.captionRegular)
                    }
                    HStack {
                        Text("Status card")
                            .font(.captionMedium)
                        Spacer()
                        Text("06/24 (Active)")
                            .font(.captionRegular)
                    }
                }
                .foregroundStyle(.foreground(.secondary))
                HStack {
                    ButtonIcon(.medium) {
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                    Text("1 of 4")
                        .font(.captionRegular)
                        .foregroundStyle(.foreground(.secondary))
                    Spacer()
                    ButtonIcon(.medium) {
                        Image(systemName: "chevron.right")
                    }
                }
            }
            DividerLine()
            VStack(spacing: 8) {
                HStack(alignment: .top) {
                    Text("Notifications")
                        .font(.bodyMedium)
                    Spacer()
                    Text("See all")
                        .font(.footnoteRegular)
                }
                .foregroundStyle(.foreground(.secondary))
                .padding(.vertical, 8)
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
            }
            HStack {
                Text("2 unread")
                    .font(.captionRegular)
                    .foregroundStyle(.foreground(.secondary))
                Spacer()
                ButtonPrimary("Mark all as read", .small)
            }
        }
        .frame(width: 320)
    }
    
    public init() {}
}

#Preview {
    InspectorDetailView()
}
