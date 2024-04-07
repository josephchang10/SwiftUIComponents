//
//  Angular3.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

public struct Angular3: ShapeStyle {
    public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        AngularGradient(stops: [
            .init(color: .init(red: 234.0 / 255, green: 168.0 / 255, blue: 176.0 / 255), location: 0),
            .init(color: .init(red: 178.0 / 255, green: 59.0 / 255, blue: 121.0 / 255), location: 0.15),
            .init(color: .init(red: 255.0 / 255, green: 0, blue: 52.0 / 255), location: 0.47),
            .init(color: .init(red: 1, green: 92.0 / 255, blue: 92.0 / 255), location: 0.64),
            .init(color: .init(red: 1, green: 167.0 / 255, blue: 177.0 / 255), location: 0.82),
            .init(color: .init(red: 234.0 / 255, green: 168.0 / 255, blue: 176.0 / 255), location: 1)
        ], center: .center, startAngle: .degrees(120), endAngle: .degrees(120 + 360))
    }
}

public extension ShapeStyle where Self == Angular3 {
    static var angular3: Self {
        Angular3()
    }
}

#Preview {
    Circle()
        .fill(Angular3())
        .stroke(.container(.divider), lineWidth: 1)
        .preferredColorScheme(.light)
}
