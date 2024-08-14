//
//  ButtonIcon.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct ButtonIcon<Icon: View>: View {
    public enum Size {
        case small
        case medium
        
        var padding: EdgeInsets {
            switch self {
            case .small:
                return .init(top: 4, leading: 12, bottom: 4, trailing: 12)
            case .medium:
                return .init(top: 6, leading: 16, bottom: 6, trailing: 16)
            }
        }
    }
    
    @Environment(\.isEnabled) private var isEnabled
    private let icon: Icon
    private let size: Size
    
    public var body: some View {
        icon
            .font(.captionMedium)
            .padding(size.padding)
            .opacity(isEnabled ? 1 : 0.2)
    }
    
    public init(_ size: Size, @ViewBuilder _ icon: () -> Icon) {
        self.icon = icon()
        self.size = size
    }
}

#Preview {
    Grid {
        GridRow(alignment: .top) {
            ButtonIcon(.small) {
                Image(systemName: "arrow.right")
            }
            ButtonIcon(.medium) {
                Image(systemName: "arrow.right")
            }
        }
    }
    .padding(10)
}
