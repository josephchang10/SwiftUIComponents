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
                    .opacity(colorScheme == .dark ? 0.1 : 0.3)
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
    
    public init( _ size: Size, text: LocalizedStringKey, state: _State = .normal) {
        self.size = size
        self.state = state
        self.text = text
        self.icon = nil
    }
    
    public init(_ size: Size, text: LocalizedStringKey, state: _State = .normal, @ViewBuilder icon: () -> some View) {
        self.size = size
        self.state = state
        self.text = text
        self.icon = AnyView(icon())
    }
}

struct ButtonMenuView: View {
    var body: some View {
        HStack(spacing: 10) {
            Group {
                ButtonMenu(.small, text: "Account") {
                    Image(systemName: "person")
                }
                ButtonMenu(.medium, text: "Account") {
                    Image(systemName: "person")
                }
                ButtonMenu(.large, text: "Account") {
                    Image(systemName: "person")
                }
                ButtonMenu(.extraLarge, text: "Account") {
                    Image(systemName: "person")
                }
            }
            .frame(width: 150)
        }
    }
}

struct ButtonMenuSelectedView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Group {
                ButtonMenu(.small, text: "Account", state: .selected) {
                    Image(systemName: "person")
                }
                ButtonMenu(.medium, text: "Account", state: .selected) {
                    Image(systemName: "person")
                }
                ButtonMenu(.large, text: "Account", state: .selected) {
                    Image(systemName: "person")
                }
                ButtonMenu(.extraLarge, text: "Account", state: .selected) {
                    Image(systemName: "person")
                }
            }
            .frame(width: 150)
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        ButtonMenuView()
            .environment(\.colorScheme, .light)
        ButtonMenuView()
            .environment(\.colorScheme, .dark)
        ButtonMenuSelectedView()
            .environment(\.colorScheme, .light)
        ButtonMenuSelectedView()
            .environment(\.colorScheme, .dark)
    }
    .padding(10)
    .padding(60)
    .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
    .preferredColorScheme(.dark)
}
