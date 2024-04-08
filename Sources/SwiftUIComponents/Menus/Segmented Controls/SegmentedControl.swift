//
//  SegmentedControl.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct SegmentedControl<Content: View>: View {
    let content: Content
    
    public var body: some View {
        HStack(spacing: 2) {
            content
        }
        .padding(2)
        .background(LinearGradient(colors: [.white.opacity(0.02), .white.opacity(0.5)], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 99))
        .overlay {
            RoundedRectangle(cornerRadius: 99)
                .inset(by: 0.5)
                .strokeBorder(.container(.divider), lineWidth: 1)
        }
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    SegmentedControl {
        ButtonToggle("Label", .small, state: .selected, showRightIcon: false) {}
        ButtonToggle("Label", .small, showRightIcon: false) {}
    }
    .padding()
    .background(.container(.background))
    .background(Color(red: 30/255, green: 30/255, blue: 30/255))
}
