//
//  Popover.swift
//
//
//  Created by Jiafu Zhang on 6/18/24.
//

import SwiftUI

public struct Popover<Content: View>: View {
    private let content: Content
    
    public var body: some View {
        VStack(spacing: 4) {
            content
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .strokeBorder(.container(.border), lineWidth: 1)
        }
        .shadowBlur(.extraLarge)
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct PopoverView: View {
    var body: some View {
        Popover {
            ButtonTooltip(.medium, text: "iPhone 15") {
                Image(systemName: "iphone")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            } rightIcon: {
                Image(systemName: "eye")
            }
            DividerLine()
            ButtonTooltip(.medium, text: "iPad Pro") {
                Image(systemName: "apps.ipad")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
            DividerLine()
            ButtonTooltip(.medium, text: "Apple Watch") {
                Image(systemName: "watchface.applewatch.case")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            } rightIcon: {
                Image(systemName: "chevron.right")
            }
            DividerLine()
            ButtonTooltip(.medium, text: "MacBook") {
                Image(systemName: "macbook")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
            DividerLine()
            ButtonTooltip(.medium, text: "Vision Pro", state: .selected) {
                Image(systemName: "eye.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
            DividerLine()
            ButtonTooltip(.medium, text: "Accessories") {
                Image(systemName: "keyboard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
        }
        .frame(width: 200)
    }
}

#Preview {
    HStack(spacing: 20) {
        PopoverView()
            .environment(\.colorScheme, .light)
        PopoverView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .padding(60)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.light)
}
