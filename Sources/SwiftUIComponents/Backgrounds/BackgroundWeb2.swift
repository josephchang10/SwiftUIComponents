//
//  BackgroundWeb2.swift
//
//
//  Created by Jiafu Zhang on 4/9/24.
//

import SwiftUI
import TailwindSwiftUI

public struct BackgroundWeb2: View {
    @Environment(\.colorScheme) var colorScheme
    
    public var body: some View {
        GeometryReader { proxy in
            let horizontalRatio = proxy.size.width / 1440
            let verticalRatio = proxy.size.height / 1440
            switch colorScheme {
            case .dark:
                Image("Background 2", bundle: .module)
                    .resizable()
                    .frame(height: proxy.size.width * 600 / 1440)
                    .frame(maxHeight: .infinity)
                    .blur(radius: .point(100))
                Image("Image", bundle: .module)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 1280 * horizontalRatio, height: horizontalRatio * 900)
                    .clipped()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .mask {
                        EllipticalGradient(colors: [
                            .init(red: 217 / 255, green: 217 / 255, blue: 217 / 255),
                            .init(red: 217 / 255, green: 217 / 255, blue: 217 / 255).opacity(0)
                        ], center: .center)
                        .frame(width: 1280 * horizontalRatio, height: horizontalRatio * 900)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                Image("Stars 3", bundle: .module)
                    .resizable()
                    .scaledToFill()
                    .blendMode(.screen)
                    .frame(width: 1244.16 * horizontalRatio, height: horizontalRatio * 995.33)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Image("Background Web 2 Grid", bundle: .module)
                    .resizable()
                    .scaledToFit()
            default:
                LinearGradient(stops: [
                    .init(color: .white, location: 0),
                    .init(color: .init(red: 126 / 255, green: 167 / 255, blue: 204 / 255), location: 0.37),
                    .init(color: .white.opacity(0), location: 1)
                ], startPoint: .top, endPoint: .bottom)
                let width = proxy.size.width * 1000 / 1440
                let height = width * 800 / 1040
                Image("Wallpaper Blur 2", bundle: .module)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipped()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .blur(radius: .point(200))
                Wave1()
                    .offset(y: 330 * verticalRatio)
                Grid2()
                    .frame(height: 1200 * verticalRatio)
                    .frame(maxHeight: .infinity)
                Grid1()
            }
        }
    }
    
    public init() {}
}

#Preview {
    BackgroundWeb2()
        .frame(width: .point(1440), height: .point(1440))
}
