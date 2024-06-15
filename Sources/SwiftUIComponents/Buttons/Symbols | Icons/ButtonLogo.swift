//
//  ButtonLogo.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct ButtonLogo<Logo: View>: View {
    let logo: Logo
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.thinMaterial)
                .padding(7)
                .rotationEffect(.degrees(45))
                .shadowBlur(.small)
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
                .padding(7)
                .rotationEffect(.degrees(45))
                .blendMode(.overlay)
            logo
                .frame(width: 24, height: 24)
        }
        .frame(width: 44, height: 44)
    }
    
    public init(@ViewBuilder _ logo: () -> Logo) {
        self.logo = logo()
    }
}

#Preview {
    ButtonLogo {
        Image(systemName: "calendar")
            .resizable()
            .padding(3)
    }
    .padding(20)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .environment(\.colorScheme, .light)
}
