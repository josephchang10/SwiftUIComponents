//
//  BackgroundWeb3.swift
//
//
//  Created by Jiafu Zhang on 4/9/24.
//

import SwiftUI
import TailwindSwiftUI

public struct BackgroundWeb3: View {
    public var body: some View {
        GeometryReader { proxy in
            LinearGradient(stops: [
                .init(color: .white, location: 0),
                .init(color: .init(red: 127 / 255, green: 204 / 255, blue: 233 / 255), location: 0.37),
                .init(color: .init(red: 46 / 255, green: 154 / 255, blue: 240 / 255), location: 0.67),
                .init(color: .init(red: 214 / 255, green: 225 / 255, blue: 234 / 255), location: 0.88),
                .init(color: .white, location: 1)
            ], startPoint: .top, endPoint: .bottom)
            .blendMode(.multiply)
            let width = proxy.size.width * 1000 / 1440
            let height = width * 800 / 1040
            Image("Wallpaper Blur 3", bundle: .module)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .blur(radius: .point(200))
            let verticalRatio = proxy.size.height / 1440
            Image("Particles", bundle: .module)
                .frame(height: 1200 * verticalRatio)
                .frame(maxHeight: .infinity)
                .blendMode(.screen)
        }
    }
    
    public init() {}
}

#Preview {
    BackgroundWeb3()
        .frame(width: .point(1440), height: .point(1440))
}
