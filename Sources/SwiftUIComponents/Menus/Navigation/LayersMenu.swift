//
//  LayersMenu.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

struct LayersMenu: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            browserButtons
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
}

#Preview {
    LayersMenu()
        .padding()
        .background(.container(.background))
        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
}
