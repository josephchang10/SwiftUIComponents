//
//  BackgroundWeb2.swift
//
//
//  Created by Jiafu Zhang on 4/9/24.
//

import SwiftUI
import TailwindSwiftUI

public struct BackgroundWeb2: View {
    public enum Mode {
        case dark
        case dark3(showStars: Bool = true)
    }
    
    @Environment(\.colorScheme) var colorScheme
    private let darkMode: Mode?
    
    public var body: some View {
        GeometryReader { proxy in
            let horizontalRatio = proxy.size.width / 1440
            let verticalRatio = proxy.size.height / 1440
            if colorScheme == .dark, let darkMode {
                switch darkMode {
                case .dark:
                    Rectangle()
                        .fill(Color(red: 5 / 255, green: 6 / 255, blue: 20 / 255))
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
                case .dark3(let showStars):
                    Rectangle()
                        .fill(.background(.blue))
                    Image("Background 3", bundle: .module)
                        .resizable()
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: proxy.size.width * 1250 / 1440)
                        .frame(maxHeight: .infinity)
                        .blur(radius: .point(100))
                    if showStars {
                        Image("Stars", bundle: .module)
                            .resizable()
                            .scaledToFill()
                            .frame(width: horizontalRatio * 1440, height: horizontalRatio * 1200)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .blendMode(.screen)
                    }
                    Image("Background Web 2 Grid", bundle: .module)
                        .resizable()
                        .scaledToFit()
                }
            } else {
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
    
    public init(darkMode: Mode? = .dark) {
        self.darkMode = darkMode
    }
}

#Preview {
    BackgroundWeb2()
        .frame(width: .point(1440), height: .point(1440))
}
