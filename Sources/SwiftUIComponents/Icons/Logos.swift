//
//  Logos.swift
//
//
//  Created by Jiafu Zhang on 5/20/24.
//

import SwiftUI

public struct Logo: View {
    public enum Logo: String, CaseIterable {
        case x
        case youtube
    }
    
    private let logo: Logo
    
    public var body: some View {
        Image(logo.rawValue + "-logo", bundle: .module)
            .resizable()
            .foregroundStyle(.foreground(.primary))
            .scaledToFit()
    }
    
    public init(_ logo: Logo) {
        self.logo = logo
    }
}

#Preview {
    VStack(spacing: 60) {
        Logo(.x)
            .frame(width: 24, height: 24)
        Logo(.youtube)
            .frame(width: 24, height: 24)
    }
    .padding(60)
    .background(.background(.primary))
    .preferredColorScheme(.light)
}
