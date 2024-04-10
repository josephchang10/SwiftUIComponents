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
                8
            case .medium:
                10
            case .large, .extraLarge:
                12
            }
        }
    }
    
    public enum State {
        case normal
        case selected
    }
    
    let action: () -> Void
    let size: Size
    let state: State
    let icon: Icon
    
    public var body: some View {
        Button(action: action) {
            icon
                .font(.captionMedium)
                .foregroundStyle(.foreground(.primary))
                .padding(size.padding)
                .frame(width: size.size, height: size.size)
                .background {
                    if state == .selected {
                        Circle()
                            .fill(.container(.background))
                            .stroke(.container(.border), lineWidth: 1)
                    }
                }
                .shadowBlur(.small)
        }
        .buttonStyle(.plain)
    }
    
    public init(_ size: Size, state: State = .normal, @ViewBuilder icon: () -> Icon, action: @escaping () -> Void) {
        self.size = size
        self.state = state
        self.icon = icon()
        self.action = action
    }
}

#Preview {
    VStack {
        HStack {
            ButtonCircle(.small) {
                Image(systemName: "moon")
            } action: {}
            ButtonCircle(.small, state: .selected) {
                Image(systemName: "moon")
            } action: {}
            ButtonCircle(.medium, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
            } action: {}
            ButtonCircle(.large, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
            } action: {}
            ButtonCircle(.extraLarge, state: .selected) {
                Image(systemName: "moon")
                    .resizable()
            } action: {}
        }
        .environment(\.colorScheme, .light)
        HStack {
            ButtonCircle(.small) {
                Image(systemName: "moon")
            } action: {}
            ButtonCircle(.small, state: .selected) {
                Image(systemName: "moon")
            } action: {}
        }
        .environment(\.colorScheme, .dark)
    }
    .padding()
}
