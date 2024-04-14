//
//  InspectorMenu.swift
//
//
//  Created by Jiafu Zhang on 4/9/24.
//

import SwiftUI

public struct InspectorMenu<Content: View>: View {
    let content: Content
    
    public var body: some View {
        VStack(spacing: 4) {
            content
        }
        .padding(10)
        .frame(maxWidth: 560)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        }
        .shadowBlurStrong(.extraLarge)
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    InspectorMenu {
        ButtonTooltip("Pixel Density") {
            Image(systemName: "arrow.up.backward.and.arrow.down.forward")
        } rightIcon: {
            Image(systemName: "chevron.down")
        } action: {}
        ZStack {
            SegmentedControl {
                ButtonToggle("1x", .small, state: .selected, showRightIcon: false)
                ButtonToggle("2x", .small, showRightIcon: false)
                ButtonToggle("3x", .small, showRightIcon: false)
                ButtonToggle("4x", .small, showRightIcon: false)
            }
        }
        .padding(10)
        DividerLine()
        ButtonTooltip("Format") {
            Image(systemName: "doc.text")
        } rightIcon: {
            Image(systemName: "chevron.down")
        } action: {}
        ZStack {
            SegmentedControl {
                ButtonToggle("PNG", .small, state: .selected, showRightIcon: false)
                ButtonToggle("JPG", .small, showRightIcon: false)
                ButtonToggle("WebP", .small, showRightIcon: false)
            }
        }
        .padding(10)
        DividerLine()
        ZStack {
            ButtonGlow("Download") {
                Image(systemName: "square.and.arrow.down")
            }
        }
        .padding(10)
    }
        .padding()
        .frame(width: 250)
        .background(.background(.secondary))
        .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
