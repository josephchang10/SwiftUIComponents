//
//  Tab.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 7/12/24.
//

import SwiftUI

public struct Tab<Content: View>: View {
    public var content: Content
    
    public var body: some View {
        HStack(spacing: 0) {
            content
        }
        .overlay(alignment: .bottom) {
            DividerLine()
        }
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct TabView: View {
    var body: some View {
        Tab {
            TabButton("CSS", state: .selected)
            TabButton("React")
            TabButton("Tailwind")
        }
        .frame(width: 340)
    }
}

#Preview {
    VStack(spacing: 20) {
        TabView()
            .environment(\.colorScheme, .light)
        TabView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .padding(60)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.light)
}
