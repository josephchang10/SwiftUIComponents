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
            BrowserButtons()
            content
        }
        .padding(10)
        .frame(minWidth: 220, maxWidth: 320)
        .background(.container(.background))
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .strokeBorder(.container(.border), lineWidth: 1)
        }
        .shadowBlurStrong(.extraLarge)
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct LayersMenuView: View {
    var body: some View {
        LayersMenu {
            ButtonTooltip(.medium, text: "Wallpaper") {
                Image(systemName: "photo")
            } rightIcon: {
                Image(systemName: "eye")
            }
            DividerLine()
            ButtonTooltip(.medium, text: "Blurs") {
                Image(systemName: "drop.halffull")
            } rightIcon: {
                Image(systemName: "eye")
            }
            DividerLine()
            ButtonTooltip(.medium, text: "Overlay") {
                Image(systemName: "wand.and.stars.inverse")
            } rightIcon: {
                Image(systemName: "eye")
            }
            DividerLine()
            ButtonTooltip(.medium, text: "UI Components", state: .selected) {
                Image(systemName: "iphone")
                    .symbolRenderingMode(.monochrome)
            } rightIcon: {
                Image(systemName: "eye")
            }
            SegmentedControl {
                ButtonToggle(.small, text: "Glass", state: .selected, showRightIcon: false)
                ButtonToggle(.small, text: "Outline", showRightIcon: false)
                ButtonToggle(.small, text: "Flat", showRightIcon: false)
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
                ButtonToggle(.small, text: "sm", state: .selected, showRightIcon: false)
                ButtonToggle(.small, text: "md", showRightIcon: false)
                ButtonToggle(.small, text: "lg", showRightIcon: false)
            }
            .padding(10)
            .width(.full)
        }
        .frame(width: 230)
    }
}

#Preview {
    HStack(spacing: 20) {
        LayersMenuView()
            .environment(\.colorScheme, .light)
        LayersMenuView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .padding(60)
//    .background(.container(.background))
    .background(Color(red: 53/255, green: 53/255, blue: 53/255))
}
