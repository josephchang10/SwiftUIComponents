//
//  ButtonIcon.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct ButtonIcon<Icon: View>: View {
    @Environment(\.isEnabled) private var isEnabled
    let icon: Icon
    
    public var body: some View {
        icon
            .font(.captionMedium)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .opacity(isEnabled ? 1 : 0.2)
    }
    
    public init(@ViewBuilder _ icon: () -> Icon) {
        self.icon = icon()
    }
}

#Preview {
    ButtonIcon {
        Image(systemName: "arrow.right")
    }
}
