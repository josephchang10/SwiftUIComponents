//
//  Separator.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct Separator: View {
    public var body: some View {
        DividerLine()
            .opacity(0)
            .overlay {
                Rectangle()
                    .fill(.container(.divider))
            }
    }
    
    public init() {}
}

#Preview {
    HStack {
        Separator()
    }
}
