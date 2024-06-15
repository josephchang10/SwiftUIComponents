//
//  ButtonBrowser.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

struct ButtonBrowser: View {
    var body: some View {
        ZStack {
            Image(systemName: "minus")
                .frame(width: 8, height: 8)
            .hidden()
        }
        .frame(width: 12, height: 12)
        .background(LinearGradient(colors: [.black, .black.opacity(0.5)], startPoint: .top, endPoint: .bottom).opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(LinearGradient(colors: [.black.opacity(0), .black], startPoint: .init(x: 0.4, y: 0.7), endPoint: .init(x: 0.7, y: 0)), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .stroke(.black.opacity(0.1), lineWidth: 1)
        }
    }
}

#Preview {
    ButtonBrowser()
        .padding()
}
