//
//  BrowserButtons.swift
//
//
//  Created by Jiafu Zhang on 6/18/24.
//

import SwiftUI

public struct BrowserButtons: View {
    @State private var isHovering = false
    
    public var body: some View {
        HStack(spacing: 8) {
            ButtonBrowser(state: isHovering ? .close : .normal)
            ButtonBrowser(state: isHovering ? .minimize : .normal)
            ButtonBrowser(state: isHovering ? .expand : .normal)
        }
        .onHover { hovering in
            withAnimation {
                isHovering = hovering
            }
        }
    }
    
    public init() {}
}

struct BrowserButtonsView: View {
    var body: some View {
        BrowserButtons()
    }
}

#Preview {
    HStack(spacing: 20) {
        BrowserButtonsView()
            .environment(\.colorScheme, .light)
        BrowserButtonsView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
}
