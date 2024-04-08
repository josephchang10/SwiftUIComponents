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
        .background(.container(.background))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .strokeBorder(.container(.border), lineWidth: 1)
        }
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
    }
        .padding()
        .background(.container(.background))
        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
}
