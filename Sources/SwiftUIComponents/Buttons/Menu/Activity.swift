//
//  Activity.swift
//
//
//  Created by Jiafu Zhang on 4/26/24.
//

import SwiftUI

public struct Activity<Avatar: View>: View {
    public enum _State {
        case normal
        case selected
    }
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var isHovering = false
    let state: _State
    let avatar: Avatar
    let title: LocalizedStringKey
    let text: LocalizedStringKey
    let time: Date
    private var timeAgo: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: time, relativeTo: Date())
    }
    
    public var body: some View {
        HStack(spacing: 8) {
            avatar
            VStack(alignment: .leading, spacing: 0) {
                name
                Text(text)
                    .font(.captionRegular)
                    .foregroundStyle(.foreground(.secondary))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .topTrailing) {
                Text(timeAgo)
                    .font(.smallRegular)
                    .foregroundStyle(.foreground(.secondary))
            }
        }
        .padding(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(state == .selected ? .container(.border) : .container(.divider), lineWidth: 1)
        }
        .background {
            if state == .selected {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.container(.background))
                    .shadowBlur(.small)
            }
            if isHovering {
                RoundedRectangle(cornerRadius: 8)
                    .fill(LinearGradient(colors: colorScheme == .dark ? [.black.opacity(0.5), .black.opacity(0.02)] :  [.white.opacity(0.02), .white.opacity(0.5)], startPoint: .top, endPoint: .bottom))
            }
        }
        .onHover { hovering in
            withAnimation {
                isHovering = hovering
            }
        }
    }
    
    var name: some View {
        Text(title)
            .font(.captionMedium)
            .padding(.trailing, 50)
    }
    
    public init(_ state: _State = .normal, title: LocalizedStringKey, text: LocalizedStringKey, time: Date,  @ViewBuilder avatar: () -> Avatar) {
        self.state = state
        self.avatar = avatar()
        self.title = title
        self.text = text
        self.time = time
    }
}

#Preview {
    VStack(spacing: 20) {
        HStack(spacing: 20) {
            Activity(title: "Dawyne Joe", text: "prepared a report", time: .now.addingTimeInterval(-60 * 2)) {
                AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1713747637487-0fbc89f8a4c8?w=100&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNTZ8fHxlbnwwfHx8fHw%3D")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 32, height: 32)
            }
            .frame(width: 220)
            Activity(.selected, title: "Dawyne Joe", text: "prepared a report", time: .now.addingTimeInterval(-60 * 2)) {
                AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1713747637487-0fbc89f8a4c8?w=100&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNTZ8fHxlbnwwfHx8fHw%3D")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 32, height: 32)
            }
            .frame(width: 220)
        }
        .environment(\.colorScheme, .light)
        HStack(spacing: 20) {
            Activity(title: "Dawyne Joe", text: "prepared a report", time: .now.addingTimeInterval(-60 * 2)) {
                AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1713747637487-0fbc89f8a4c8?w=100&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNTZ8fHxlbnwwfHx8fHw%3D")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 32, height: 32)
            }
            .frame(width: 220)
            Activity(.selected, title: "Dawyne Joe", text: "prepared a report", time: .now.addingTimeInterval(-60 * 2)) {
                AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1713747637487-0fbc89f8a4c8?w=100&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNTZ8fHxlbnwwfHx8fHw%3D")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 32, height: 32)
            }
            .frame(width: 220)
        }
    }
    .padding(20)
    .background(Color(red: 53/255, green: 53/255, blue: 53/255))
}
