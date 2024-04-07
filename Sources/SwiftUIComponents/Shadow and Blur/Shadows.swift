//
//  Shadows.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI

public extension View {
    func shadowBlur() -> some View {
        compositingGroup()
            .shadow(color: .black.opacity(0.05), radius: 0, y: 1)
            .shadow(color: .black.opacity(0.05), radius: 4, y: 4)
            .shadow(color: .black.opacity(0.1), radius: 10, y: 10)
            .background {
                self
            }
    }
}

struct ShadowsView: View {
    var body: some View {
        VStack {
            ButtonPrimary("regular sm", icon: Image(systemName: "chevron.right")) {}
                .shadowBlur()
        }
    }
}

#Preview {
    ShadowsView()
        .frame(width: .point(1024), height: .point(1024))
        .background {
            Blur5(radius1: 300, radius2: 600)
                .frame(width: .point(1581), height: .point(1581))
                .offset(y: .point(-600))
            Wave1()
                .frame(width: .point(1440), height: .point(1024))
            Grid1()
                .frame(width: .point(1440), height: .point(1024))
        }
        .preferredColorScheme(.light)
}
