//
//  LayersMenu.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct LayersMenu<Content: View>: View {
    let content: Content
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            browserButtons
            content
        }
        .padding(10)
        .frame(minWidth: 220, maxWidth: 320)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .strokeBorder(.container(.border), lineWidth: 1)
        }
        .shadowBlurStrong(.extraLarge)
    }
    
    var browserButtons: some View {
        HStack(spacing: 8) {
            ButtonBrowser()
            ButtonBrowser()
            ButtonBrowser()
        }
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    LayersMenu {
        ButtonTooltip("Wallpaper") {
            Image(systemName: "photo")
        } rightIcon: {
            Image(systemName: "eye")
        } action: {}
        DividerLine()
        ButtonTooltip("Blurs") {
            Image(systemName: "drop.halffull")
        } rightIcon: {
            Image(systemName: "eye")
        } action: {}
        DividerLine()
        ButtonTooltip("Overlay") {
            Image(systemName: "wand.and.stars.inverse")
        } rightIcon: {
            Image(systemName: "eye")
        } action: {}
        DividerLine()
        ButtonTooltip("UI Components", state: .selected) {
            Image(systemName: "iphone")
                .symbolRenderingMode(.monochrome)
        } rightIcon: {
            Image(systemName: "eye")
        } action: {}
        SegmentedControl {
            ButtonToggle("Glass", .small, state: .selected, showRightIcon: false)
            ButtonToggle("Outline", .small, showRightIcon: false)
            ButtonToggle("Flat", .small, showRightIcon: false)
        }
        .padding(10)
        .width(.full)
        HStack(spacing: 10) {
            GridItem {
                Image(systemName: "moon")
                    .resizable()
                    .fontWeight(.medium)
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .padding(12)
            }
            GridItem {
                Image(systemName: "sun.max")
                    .resizable()
                    .fontWeight(.medium)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(10)
            }
            GridItem {
                Image(systemName: "wand.and.stars.inverse")
                    .resizable()
                    .fontWeight(.medium)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(10)
            }
            GridItem {
                Image(systemName: "eye")
                    .resizable()
                    .fontWeight(.medium)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(10)
            }
        }
        .padding(10)
        .width(.full)
        SegmentedControl {
            ButtonToggle("sm", .small, state: .selected, showRightIcon: false)
            ButtonToggle("md", .small, showRightIcon: false)
            ButtonToggle("lg", .small, showRightIcon: false)
        }
        .padding(10)
        .width(.full)
    }
        .padding()
        .background(.container(.background))
        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
}
