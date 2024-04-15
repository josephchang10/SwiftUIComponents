//
//  Divider.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct DividerLine: View {
    public var body: some View {
        Divider()
            .opacity(0)
            .overlay {
                ContainerDivider()
            }
    }
    
    public init() {
        
    }
}

#Preview {
    VStack(spacing: 20) {
        DividerLine()
            .environment(\.colorScheme, .light)
        DividerLine()
            .environment(\.colorScheme, .dark)
    }
    .frame(width: 220)
    .padding(20)
    .background(.container(.background))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
