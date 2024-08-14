//
//  NavigationOutline.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 8/13/24.
//

import SwiftUI

struct NavigationOutline: View {
    var body: some View {
        HStack(spacing: 0) {
            ButtonIcon(.small) {
                Image(systemName: "arrow.left")
            }
            .disabled(true)
            Separator()
            ButtonIcon(.small) {
                Image(systemName: "arrow.right")
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .inset(by: 0.5)
                .stroke(.container(.divider), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    NavigationOutline()
        .padding(20)
}
