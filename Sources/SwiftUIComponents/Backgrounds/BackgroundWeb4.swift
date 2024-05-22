//
//  BackgroundWeb4.swift
//
//
//  Created by Jiafu Zhang on 4/9/24.
//

import SwiftUI
import TailwindSwiftUI

public struct BackgroundWeb4: View {
    @Environment(\.colorScheme) private var colorScheme
    
    public var body: some View {
        GeometryReader { proxy in
            switch colorScheme {
            case .dark:
                let horizontalRatio = proxy.size.width / 1440
                let verticalRatio = proxy.size.height / 1440
                Image("Background Blur 4", bundle: .module)
                    .resizable()
                    .scaledToFill()
                    .frame(width: horizontalRatio * 1000, height: verticalRatio * 800)
                    .clipped()
                    .rotationEffect(.degrees(180))
                    .scaleEffect(x: 1, y: -1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .blur(radius: .point(50))
                Image("Background Web 4 Grid", bundle: .module)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 1000 * horizontalRatio, height: 1000 * verticalRatio)
                    .clipped()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .blendMode(.screen)
                Image("Particles 1", bundle: .module)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 1440 * horizontalRatio, height: 900 * verticalRatio)
                    .clipped()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .blendMode(.screen)
            default :
                let horizontalRatio = proxy.size.width / 2400
                let verticalRatio = proxy.size.height / 1440
                Grid4()
                    .frame(width: 1440 * horizontalRatio, height: 778.36 * verticalRatio)
                    .width(.full)
                    .offset(y: 512 * verticalRatio)
                Ellipse()
                    .fill(.angular1)
                    .blur(radius: .point(50))
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
                    .blur(radius: .point(100))
                    .frame(width: 1319 * horizontalRatio, height: 569.5 * verticalRatio)
                    .offset(x: 400 * horizontalRatio, y: 361.93 * verticalRatio)
                Exposure5()
                    .frame(width: 1425.6 * horizontalRatio, height: 1013.76 * verticalRatio)
                    .width(.full)
                    .offset(y: 173 * verticalRatio)
            }
        }
        .background(colorScheme == .dark ? Color(red: 6 / 255, green: 7 / 255, blue: 21 / 255) : Color(red: 242 / 255, green: 243 / 255, blue: 250 / 255))
    }
    
    public init() {}
}

#Preview {
    VStack(alignment: .leading, spacing: 20) {
        BackgroundWeb4()
            .frame(width: .point(2400 / 2), height: .point(1440 / 2))
            .environment(\.colorScheme, .light)
        BackgroundWeb4()
            .frame(width: .point(1440 / 2), height: .point(1440 / 2))
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
}
