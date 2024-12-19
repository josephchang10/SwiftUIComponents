//
//  Angular1.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

public struct Angular1: ShapeStyle {
    public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        AngularGradient(stops: [
            .init(color: .init(red: 113.0 / 255, green: 71.0 / 255, blue: 255.0 / 255), location: 0),
            .init(color: .init(red: 66.0 / 255, green: 232.0 / 255, blue: 255.0 / 255).opacity(0.2), location: 0.2),
            .init(color: .init(red: 66.0 / 255, green: 232.0 / 255, blue: 255.0 / 255).opacity(0), location: 0.26),
            .init(color: .init(red: 66.0 / 255, green: 232.0 / 255, blue: 255.0 / 255).opacity(0.2), location: 0.4),
            .init(color: .init(red: 255.0 / 255, green: 126.0 / 255, blue: 171.0 / 255).opacity(0.5), location: 0.52),
            .init(color: .init(red: 48.0 / 255, green: 131.0 / 255, blue: 255.0 / 255), location: 0.76),
            .init(color: .init(red: 113.0 / 255, green: 71.0 / 255, blue: 255.0 / 255), location: 1)
        ], center: .center, startAngle: .degrees(120), endAngle: .degrees(120 + 360))
    }
    
    public init() {}
}

public extension ShapeStyle where Self == Angular1 {
    static var angular1: Self {
        Angular1()
    }
}

#Preview {
    Circle()
        .fill(Angular1())
        .stroke(.container(.divider), lineWidth: 1)
        .preferredColorScheme(.light)
}
