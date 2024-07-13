//
//  TabButton.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 7/12/24.
//

import SwiftUI

public struct TabButton: View {
    public enum _State {
        case normal
        case selected
    }
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var isHovering = false
    private let state: _State
    private let titleKey: LocalizedStringKey
    
    private var backgroundColor: Color {
        switch colorScheme {
        case .dark:
            .white
        default :
            .init(red: 38 / 255, green: 112 / 255, blue: 233 / 255)
        }
    }
    
    public var body: some View {
        Text(titleKey)
            .font(.captionMedium)
            .foregroundStyle(.foreground(.primary))
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .onHover { hovering in
                withAnimation {
                    isHovering = hovering
                }
            }
            .overlay(alignment: .bottom) {
                if isHovering || state == .selected {
                    line
                }
                if state == .selected {
                    glow
                }
            }
            .background {
                if state == .selected {
                    LinearGradient(colors: [
                        backgroundColor,
                        backgroundColor.opacity(0)
                    ], startPoint: .bottom, endPoint: .top).opacity(0.3)
                }
            }
    }
    
    var glow: some View {
        Rectangle()
            .fill(colorScheme == .dark ? .white : Color(red: 0, green: 102 / 255, blue: 1))
            .frame(height: 2)
            .blur(radius: 10)
    }
    
    var line: some View {
        Rectangle()
            .fill(colorScheme == .dark ? .white : Color(red: 0, green: 102 / 255, blue: 1))
            .frame(height: 1)
    }
    
    public init(_ titleKey: LocalizedStringKey, state: _State = .normal) {
        self.titleKey = titleKey
        self.state = state
    }
}

struct TabButtonView: View {
    var body: some View {
        HStack(spacing: 20) {
            Group {
                TabButton("CSS")
                TabButton("CSS", state: .selected)
            }
            .frame(width: 120)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        TabButtonView()
            .environment(\.colorScheme, .light)
        TabButtonView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .padding(60)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.light)
}
