//
//  Menu.swift
//
//
//  Created by Jiafu Zhang on 4/11/24.
//

import SwiftUI

public struct SegmentedMenu<Segments: View>: View {
    let segments: Segments
    
    public var body: some View {
        HStack(spacing: 4) {
            segments
        }
        .padding(4)
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(.container(.background))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .inset(by: 0.5)
                .strokeBorder(.container(.border), lineWidth: 1)
        }
        .shadowBlur(.small)
    }
    
    public init(@ViewBuilder segments: () -> Segments) {
        self.segments = segments()
    }
}

#Preview {
    SegmentedMenu {
        ButtonToggle("Menu", .small, showRightIcon: false) {}
        ButtonToggle("Menu", .small, state: .selected) {}
    }
    .padding()
    .background(.container(.background))
    .background(Color(red: 30/255, green: 30/255, blue: 30/255))
}
