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

struct InsepctorMenuView: View {
    var body: some View {
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
                ButtonGlow(.small, text: "Download", showGlow: false) {
                    Image(systemName: "square.and.arrow.down")
                }
            }
            .padding(10)
        }
        .frame(width: 220)
    }
}

#Preview {
    HStack(spacing: 20) {
        InsepctorMenuView()
            .environment(\.colorScheme, .light)
        InsepctorMenuView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .padding(60)
//    .background(.background(.secondary))
    .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
}
