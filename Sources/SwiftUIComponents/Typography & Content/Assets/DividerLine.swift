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
    VStack {
        Text("Hello, World!")
        DividerLine()
        Text("Hello, World!")
    }
    .fixedSize(horizontal: true, vertical: false)
}
