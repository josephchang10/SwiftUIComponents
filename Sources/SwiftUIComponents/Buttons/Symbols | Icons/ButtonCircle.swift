//
//  ButtonCircle.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct ButtonCircle<Icon: View>: View {
    public enum Size {
        case small, medium, large, extraLarge
        
        var size: CGFloat {
            switch self {
            case .small:
                28
            case .medium:
                32
            case .large:
                36
            case .extraLarge:
                44
            }
        }
        
        var padding: CGFloat {
            switch self {
            case .small:
                6
            case .medium:
                8
            case .large, .extraLarge:
                10
            }
        }
    }
    
    public enum _State {
        case normal
        case selected
    }
    
    @State private var isHovering = false
    
    let size: Size
    let state: _State
    let icon: Icon
    
    public var body: some View {
        icon
            .fontWeight(.medium)
            .foregroundStyle(.foreground(.primary))
            .padding(size.padding)
            .frame(width: size.size, height: size.size)
            .background {
                if state == .selected {
                    Circle()
                        .fill(.ultraThinMaterial)
                        .fill(.container(.background))
                }
            }
            .overlay {
                if state == .selected {
                    Circle()
//                        .inset(by: 0.5)
                        .stroke(.container(.border), lineWidth: 1)
                } else if isHovering {
                    Circle()
                        .inset(by: 0.5)
                        .stroke(.foreground(.tertiary), lineWidth: 1)
                }
            }
            .shadowBlur(.small)
            .onHover { hovering in
                withAnimation {
                    isHovering = hovering
                }
            }
    }
    
    public init(_ size: Size, state: _State = .normal, @ViewBuilder icon: () -> Icon) {
        self.size = size
        self.state = state
        self.icon = icon()
    }
}

#Preview {
    VStack(spacing: 10) {
        HStack(alignment: .top, spacing: 10) {
            ButtonCircle(.small) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.medium) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.large) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.extraLarge) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(4)
            }
            ButtonCircle(.small, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.medium, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.large, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.extraLarge, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(4)
            }
        }
        .environment(\.colorScheme, .light)
        HStack(alignment: .top, spacing: 10) {
            ButtonCircle(.small) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.medium) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.large) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.extraLarge) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(4)
            }
            ButtonCircle(.small, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.medium, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.large, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(2.665)
            }
            ButtonCircle(.extraLarge, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
                    .padding(4)
            }
        }
        .environment(\.colorScheme, .dark)
    }
    .padding(10)
    .padding(60)
    .background(.background(.secondary))
    .background(Color(red: 30/255, green: 30/255, blue: 30/255))
}
