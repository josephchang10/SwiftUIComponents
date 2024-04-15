//
//  Input.swift
//
//
//  Created by Jiafu Zhang on 4/15/24.
//

import SwiftUI

public struct Input<Icon: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    let prompt: LocalizedStringKey
    let text: Binding<String>
    let icon: Icon
    let showLeftIcon: Bool
    let showRightIcon: Bool
    
    public var body: some View {
        HStack(spacing: 8) {
            if showLeftIcon {
                iconCircle
            }
            TextField("", text: text)
                .textFieldStyle(.plain)
                .overlay(alignment: .leading) {
                    if text.wrappedValue.isEmpty {
                        Text(prompt)
                            .font(.captionRegular)
                    }
                }
            if showRightIcon {
                iconCircle
            }
        }
        .padding(.leading, 12)
        .padding(.vertical, 4)
        .padding(.trailing, 8)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(colors: [
                .white.opacity(colorScheme == .dark ? 1 : 0.5),
                .white.opacity(colorScheme == .dark ? 0.5 : 0.05)
            ], startPoint: .bottom, endPoint: .top))
                .opacity(colorScheme == .dark ? 0.1 : 1)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(LinearGradient(colors: [
                    .white.opacity(0.5),
                    .white.opacity(0)
                ], startPoint: .bottom, endPoint: .top).opacity(colorScheme == .dark ? 0.1 : 1), lineWidth: 1)
                .strokeBorder(.white.opacity(0.1), lineWidth: 1)
        }
        .shadowBlur(.small)
        .frame(minWidth: 140, maxWidth: 500)
    }
    
    var iconCircle: some View {
        IconCircle {
            icon
        }
    }
    
    public init(_ prompt: LocalizedStringKey, text: Binding<String>, showLeftIcon: Bool = false, showRightIcon: Bool = true, @ViewBuilder icon: () -> Icon) {
        self.prompt = prompt
        self.text = text
        self.icon = icon()
        self.showLeftIcon = showLeftIcon
        self.showRightIcon = showRightIcon
    }
    
    public init(_ prompt: LocalizedStringKey, text: Binding<String>, showLeftIcon: Bool, @ViewBuilder icon: () -> Icon) {
        self.prompt = prompt
        self.text = text
        self.icon = icon()
        self.showLeftIcon = showLeftIcon
        self.showRightIcon = false
    }
    
}

#Preview {
    VStack(spacing: 20) {
        Input("Email address", text: .constant("")) {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
        }
            .frame(width: 200)
            .environment(\.colorScheme, .light)
        Input("Email address", text: .constant("")) {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
        }
            .frame(width: 200)
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .background(Color(red: 53/255, green: 53/255, blue: 53/255))
}
