//
//  Blur5.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

struct Blur5: View {
    var radius1: CGFloat = 200
    var radius2: CGFloat = 400
    
    var body: some View {
        GeometryReader { proxy in
            let ratio = proxy.size.width / 1054
            Circle()
                .fill(.gradient(.blue1))
                .blur(radius: radius1 / 5)
            Circle()
                .fill(.angular3)
                .blur(radius: radius2 / 6)
                .frame(width: ratio * 807)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    Blur5()
        .frame(width: .point(1054), height: .point(1054))
        .padding(50)
        .preferredColorScheme(.light)
}
