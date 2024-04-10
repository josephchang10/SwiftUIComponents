//
//  Toggle.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct Toggle<ButtonsContent: View>: View {
    let isVertical: Bool
    let buttonsContent: ButtonsContent
    
    var buttons: some View {
        if isVertical {
            AnyView(VStack(spacing: 4) {
                buttonsContent
            })
        } else {
            AnyView(HStack(spacing: 4) {
                buttonsContent
            })
        }
    }
    
    public var body: some View {
        buttons
        .padding(4)
        .background {
            RoundedRectangle(cornerRadius: 99)
                .fill(.container(.background))
                .stroke(.container(.border), lineWidth: 1)
        }
    }
    
    public init(isVertical: Bool = false, @ViewBuilder _ buttonsContent: () -> ButtonsContent) {
        self.isVertical = isVertical
        self.buttonsContent = buttonsContent()
    }
}

#Preview {
    Toggle {
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "moon")
        } action: {}
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        } action: {}
    }
    .padding()
    .environment(\.colorScheme, .light)
}

#Preview {
    Toggle(isVertical: true) {
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "moon")
        } action: {}
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        } action: {}
    }
    .padding()
    .environment(\.colorScheme, .light)
}
