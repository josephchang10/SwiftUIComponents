//
//  Stars2.swift
//
//
//  Created by Jiafu Zhang on 4/10/24.
//

import SwiftUI

public struct Stars2: View {
    public var body: some View {
        Image("Stars 3", bundle: .module)
            .resizable()
            .scaledToFit()
            .blendMode(.screen)
    }
    
    public init() {}
}

#Preview {
    Stars2()
}
