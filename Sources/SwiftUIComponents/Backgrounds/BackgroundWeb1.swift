//
//  BackgroundWeb1.swift
//
//
//  Created by Jiafu Zhang on 4/4/24.
//

import SwiftUI
import TailwindSwiftUI

public struct BackgroundWeb1: View {
    public var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width * 1040 / 1440
            let height = width * 800 / 1040
            Image("Wallpaper Blur", bundle: .module)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .blur(radius: .point(200))
            LinearGradient(colors: [.init(red: 64 / 255, green: 105 / 255, blue: 228 / 255), .white.opacity(0)], startPoint: .top, endPoint: .bottom)
            Grid1()
            let verticalRatio = proxy.size.height / 1440
            Wave1()
                .offset(y: 330 * verticalRatio)
            Grid2()
                .frame(height: 1200 * verticalRatio)
                .frame(maxHeight: .infinity)
        }
    }
    
    public init() {}
}

#Preview {
    BackgroundWeb1()
        .frame(width: 360, height: 360)
        .preferredColorScheme(.light)
}
