//
//  Input.swift
//
//
//  Created by Jiafu Zhang on 4/15/24.
//

import SwiftUI

public struct Input: View {
    @Environment(\.colorScheme) private var colorScheme
    let prompt: LocalizedStringKey
    let text: Binding<String>
    let icon: AnyView?
    let showLeftIcon: Bool
    let showRightIcon: Bool
    let axis: Axis
    
    public var body: some View {
        HStack(spacing: 8) {
            if showLeftIcon {
                iconCircle
            }
            TextField("", text: text, prompt: Text(prompt).font(.captionRegular).foregroundStyle(.red), axis: axis)
//            TextField(prompt, text: text, axis: .vertical)
                .textFieldStyle(.plain)
//                .overlay(alignment: .leading) {
//                    if text.wrappedValue.isEmpty {
//                        Text(prompt)
//                            .font(.captionRegular)
//                            .allowsHitTesting(false)
//                    }
//                }
            if showRightIcon {
                iconCircle
            }
        }
        .padding(.leading, 12)
        .padding(.vertical, 4)
        .padding(.trailing, 8)
        .frame(minHeight: 32) // TODO: Make this dynamic
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
//        .frame(minWidth: 140, maxWidth: 500)
    }
    
    var iconCircle: some View {
        IconCircle {
            if let icon {
                icon
            }
        }
    }
    
    public init(_ prompt: LocalizedStringKey, text: Binding<String>, showLeftIcon: Bool = false, showRightIcon: Bool = true, @ViewBuilder icon: () -> some View) {
        self.prompt = prompt
        self.text = text
        self.icon = AnyView(icon())
        self.showLeftIcon = showLeftIcon
        self.showRightIcon = showRightIcon
        self.axis = .horizontal
    }
    
    public init(_ prompt: LocalizedStringKey, text: Binding<String>, showLeftIcon: Bool, @ViewBuilder icon: () -> some View) {
        self.prompt = prompt
        self.text = text
        self.icon = AnyView(icon())
        self.showLeftIcon = showLeftIcon
        self.showRightIcon = false
        self.axis = .horizontal
    }
    
    public init(_ prompt: LocalizedStringKey, text: Binding<String>, axis: Axis = .horizontal) {
        self.prompt = prompt
        self.text = text
        self.icon = nil
        self.showLeftIcon = false
        self.showRightIcon = false
        self.axis = axis
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
        Input("Email address", text: .constant(""))
            .frame(width: 200)
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .background(Color(red: 53/255, green: 53/255, blue: 53/255))
}
