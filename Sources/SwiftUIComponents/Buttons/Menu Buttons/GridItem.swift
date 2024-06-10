//
//  GridItem.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct GridItem<Icon: View>: View {
    let icon: Icon
    
    public var body: some View {
        icon
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .strokeBorder(.container(.border), lineWidth: 1)
            }
            .shadowBlur(.small)
    }
    
    public init(@ViewBuilder icon: () -> Icon) {
        self.icon = icon()
    }
}

#Preview {
    GridItem {
        Image(systemName: "cube")
            .resizable()
            .font(.captionMedium)
            .scaledToFit()
            .frame(width: 24, height: 24)
            .padding(36)
    }
    .padding()
    .background(.container(.background))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
