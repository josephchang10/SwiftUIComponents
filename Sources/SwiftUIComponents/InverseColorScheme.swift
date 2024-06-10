//
//  InverseColorScheme.swift
//
//
//  Created by Jiafu Zhang on 6/10/24.
//

import SwiftUI

struct InverseColorScheme: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, colorScheme == .dark ? .light : .dark)
    }
}

public extension View {
    func inverseColorScheme() -> some View {
        modifier(InverseColorScheme())
    }
}

#Preview {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .inverseColorScheme()
}
