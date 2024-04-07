//
//  Gradients.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct GradientsBlue1: ShapeStyle {
    public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        LinearGradient(colors: [.init(red: 68.0 / 255, green: 0, blue: 155.0 / 255), .init(red: 35.0 / 255, green: 112.0 / 255, blue: 202.0 / 255)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

public enum Gradient {
    case blue1
}

public extension ShapeStyle where Self == AnyShapeStyle {
    static func gradient(_ gradient: Gradient) -> Self {
        switch gradient {
        case .blue1:
            AnyShapeStyle(GradientsBlue1())
        }
    }
}

struct GradientsView: View {
    var body: some View {
        HStack {
            Circle()
                .fill(.gradient(.blue1))
        }
    }
}

#Preview {
    GradientsView()
}
