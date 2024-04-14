//
//  ButtonMenu.swift
//
//
//  Created by Jiafu Zhang on 4/11/24.
//

import SwiftUI

public struct ButtonMenu: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isHovering = false
    
    public enum Size {
        case small, medium, large, extraLarge
        
        var spacing: CGFloat {
            switch self {
            case .small, .medium:
                8
            case .large, .extraLarge:
                12
            }
        }
        
        var font: Font {
            switch self {
            case .small, .medium:
                .captionMedium
            case .large:
                .footnoteMedium
            case .extraLarge:
                .bodyMedium
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            case .small:
                12
            case .medium, .large:
                16
            case .extraLarge:
                20
            }
        }
        
        var verticalPadding: CGFloat {
            switch self {
            case .small:
                4
            case .medium:
                6
            case .large:
                8
            case .extraLarge:
                10
            }
        }
    }
    
    public enum _State {
        case normal, selected
    }
    
    let state: _State
    let size: Size
    let text: LocalizedStringKey
    let icon: AnyView?
    
    private var color: Color {
        colorScheme == .dark ? .foreground(.primary) : Color(red: 38 / 255, green: 112 / 255, blue: 233 / 255)
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            glow
                .padding(.vertical, -size.verticalPadding)
                .opacity(state == .selected ? 1 : 0)
            Text(text)
                .width(.full, alignment: .leading)
            Spacer()
                .frame(width: size.spacing)
            if let icon {
                icon
            }
        }
        .font(size.font)
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .frame(width: 150)
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .overlay(alignment: .leading) {
            if state == .selected {
                glow
            }
            if isHovering || state == .selected {
                Rectangle()
                    .fill(color)
                    .frame(width: 1)
            }
        }
        .background {
            if state == .selected {
                LinearGradient(colors: [color, color.opacity(0)], startPoint: .leading, endPoint: .trailing)
                    .opacity(0.3)
            }
        }
        .onHover { hovering in
            withAnimation {
                isHovering = hovering
            }
        }
    }
    
    var glow: some View {
        Rectangle()
            .fill(color)
            .frame(width: .point(3))
            .blur(radius: 10)
    }
    
    public init(_ text: LocalizedStringKey, state: _State = .normal, _ size: Size) {
        self.state = state
        self.size = size
        self.text = text
        self.icon = nil
    }
    
    public init(_ text: LocalizedStringKey, state: _State = .normal, _ size: Size, @ViewBuilder icon: () -> some View) {
        self.state = state
        self.size = size
        self.text = text
        self.icon = AnyView(icon())
    }
}

#Preview {
    VStack(spacing: 10) {
        HStack(spacing: 10) {
            ButtonMenu("Account", .small) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", .medium) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", .large) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", .extraLarge) {
                Image(systemName: "person")
            }
        }
        .environment(\.colorScheme, .light)
        HStack(spacing: 10) {
            ButtonMenu("Account", .small) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", .medium) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", .large) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", .extraLarge) {
                Image(systemName: "person")
            }
        }
        .environment(\.colorScheme, .dark)
        HStack(spacing: 10) {
            ButtonMenu("Account", state: .selected, .small) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", state: .selected, .medium) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", state: .selected, .large) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", state: .selected, .extraLarge) {
                Image(systemName: "person")
            }
        }
        .environment(\.colorScheme, .light)
        HStack(spacing: 10) {
            ButtonMenu("Account", state: .selected, .small) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", state: .selected, .medium) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", state: .selected, .large) {
                Image(systemName: "person")
            }
            ButtonMenu("Account", state: .selected, .extraLarge) {
                Image(systemName: "person")
            }
        }
        .environment(\.colorScheme, .dark)
    }
    .padding()
    .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
    .preferredColorScheme(.dark)
}
