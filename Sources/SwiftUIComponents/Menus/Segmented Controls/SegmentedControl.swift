//
//  SegmentedControl.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct SegmentedControl<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    let content: Content
    
    public var body: some View {
        HStack(spacing: 2) {
            Group {
                content
            }
            .shadowBlur(.small)
        }
        .padding(3)
        .background {
            RoundedRectangle(cornerRadius: 99)
                .fill(LinearGradient(colors: [.white.opacity(0.02), .white.opacity(colorScheme == .dark ? 0.1 : 0.5)], startPoint: .top, endPoint: .bottom))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 99)
                .strokeBorder(.container(.divider), lineWidth: 1)
        }
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct SegmentedControlView: View {
    var body: some View {
        VStack(spacing: 20) {
            SegmentedControl {
                ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
                ButtonToggle(.small, text: "Label", showRightIcon: false)
            }
            SegmentedControl {
                ButtonToggle(.small, text: "Label", showRightIcon: false)
                ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
            }
        }
    }
}

#Preview {
    SegmentedControlView()
        .padding(20)
        .background(.container(.background))
        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
}
