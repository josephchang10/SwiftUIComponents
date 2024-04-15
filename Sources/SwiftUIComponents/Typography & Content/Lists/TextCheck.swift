//
//  TextCheck.swift
//
//
//  Created by Jiafu Zhang on 4/15/24.
//

import SwiftUI

public struct TextCheck: View {
    let key: LocalizedStringKey
    let icon: AnyView?
    
    public var body: some View {
        HStack(spacing: 8) {
            ButtonCheck {
                if let icon {
                    icon
                } else {
                    Image(systemName: "checkmark")
                }
            }
            Text(key)
                .foregroundStyle(.foreground(.secondary))
        }
    }
    
    public init(_ key: LocalizedStringKey) {
        self.key = key
        self.icon = nil
    }
    
    public init(_ key: LocalizedStringKey, @ViewBuilder icon: () -> some View) {
        self.key = key
        self.icon = AnyView(icon())
    }
}

#Preview {
    VStack {
        TextCheck("All 200+ components")
            .environment(\.colorScheme, .light)
        TextCheck("All 200+ components")
            .environment(\.colorScheme, .dark)
    }
    .padding()
    .background(.container(.background))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
