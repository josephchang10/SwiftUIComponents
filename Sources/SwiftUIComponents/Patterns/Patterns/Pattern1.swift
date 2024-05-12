//
//  Pattern1.swift
//
//
//  Created by Jiafu Zhang on 5/10/24.
//

import SwiftUI

public struct Pattern1: View {
    public var body: some View {
        Image("Pattern1Shape", bundle: .module)
            .resizable()
            .scaledToFill()
    }
    
    public init() {}
}

#Preview {
    Pattern1()
        .frame(width: 347.22, height: 345.97)
        .padding(60)
        .background(.background(.secondary))
        .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
