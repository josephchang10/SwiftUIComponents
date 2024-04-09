//
//  BackgroundWeb4.swift
//  
//
//  Created by Jiafu Zhang on 4/9/24.
//

import SwiftUI
import TailwindSwiftUI

public struct BackgroundWeb4: View {
    public var body: some View {
        GeometryReader { proxy in
            let horizontalRatio = proxy.size.width / 2400
            let verticalRatio = proxy.size.height / 1440
            Grid4()
                .frame(width: 1440 * horizontalRatio, height: 778.36 * verticalRatio)
                .width(.full)
                .offset(y: 512 * verticalRatio)
            Ellipse()
                .fill(.angular1)
                .blur(radius: .point(200))
                .frame(width: 1500 * horizontalRatio, height: 702 * verticalRatio)
                .width(.full)
                .offset(y: 254 * verticalRatio)
            Ellipse()
                .fill(AngularGradient(stops: [
                    .init(color: .init(red: 136 / 255, green: 163 / 255, blue: 199 / 255), location: 0),
                    .init(color: .init(red: 43 / 255, green: 110 / 255, blue: 209 / 255), location: 0.16),
                    .init(color: .init(red: 79 / 255, green: 103 / 255, blue: 135 / 255), location: 0.69),
                    .init(color: .init(red: 136 / 255, green: 163 / 255, blue: 199 / 255), location: 1)
                ], center: .center, angle: .degrees(120)))
                .blur(radius: .point(200))
                .frame(width: 1319 * horizontalRatio, height: 569.5 * verticalRatio)
                .offset(x: 400 * horizontalRatio, y: 361.93 * verticalRatio)
            Exposure5()
                .frame(width: 1425.6 * horizontalRatio, height: 1013.76 * verticalRatio)
                .width(.full)
                .offset(y: 173 * verticalRatio)
        }
        .background(Color(red: 242 / 255, green: 243 / 255, blue: 250 / 255))
    }
    
    public init() {}
}

#Preview {
    BackgroundWeb4()
        .frame(width: .point(2400), height: .point(1440))
}
