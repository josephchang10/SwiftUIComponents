//
//  Blur5.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

struct Blur5: View {
//    var radius1: CGFloat = 200
//    var radius2: CGFloat = 400
    
    var body: some View {
        Image("Blur 5", bundle: .module)
            .resizable()
            .scaledToFill()
//        GeometryReader { proxy in
//            let ratio = proxy.size.width / 1054
//            Circle()
//                .fill(.gradient(.blue1))
//                .blur(radius: .point(radius1 * ratio))
//            Circle()
//                .fill(.angular3)
//                .blur(radius: .point(radius2 * ratio))
//                .frame(width: ratio * 807)
//                .offset(x: -103 * ratio, y: 53 * ratio)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
    }
}

#Preview {
    Blur5()
        .frame(width: .point(1440 / 2), height: .point(1440 / 2))
//        .padding(50)
        .preferredColorScheme(.dark)
}
