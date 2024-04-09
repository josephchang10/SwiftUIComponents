//
//  BackgroundWeb2.swift
//
//
//  Created by Jiafu Zhang on 4/9/24.
//

import SwiftUI
import TailwindSwiftUI

public struct BackgroundWeb2: View {
    public var body: some View {
        GeometryReader { proxy in
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
            let verticalRatio = proxy.size.height / 1440
            Wave1()
                .offset(y: 330 * verticalRatio)
            Grid2()
                .frame(height: 1200 * verticalRatio)
                .frame(maxHeight: .infinity)
            Grid1()
        }
    }
    
    public init() {}
}

#Preview {
    BackgroundWeb2()
        .frame(width: .point(1440), height: .point(1440))
}
