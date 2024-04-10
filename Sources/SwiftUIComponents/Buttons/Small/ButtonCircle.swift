//
//  ButtonCircle.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct ButtonCircle<Icon: View>: View {
    public enum State {
        case normal
        case selected
    }
    
    let action: () -> Void
    let state: State
    let icon: Icon
    
    public var body: some View {
        Button(action: action) {
            icon
                .font(.captionMedium)
                .foregroundStyle(.foreground(.primary))
                .padding(6)
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
    
    public init(state: State = .normal, @ViewBuilder icon: () -> Icon, action: @escaping () -> Void) {
        self.state = state
        self.icon = icon()
        self.action = action
    }
}

#Preview {
    VStack {
        ButtonCircle {
            Image(systemName: "moon")
        } action: {}
            .environment(\.colorScheme, .light)
        ButtonCircle {
            Image(systemName: "moon")
        } action: {}
            .environment(\.colorScheme, .dark)
    }
    .padding()
}
