//
//  CompanyLogo.swift
//
//
//  Created by Jiafu Zhang on 5/10/24.
//

import SwiftUI

public struct CompanyLogo: View {
    public enum Logo: String {
        case visa
        case mastercard
    }
    
    private let logo: Logo
    
    public var body: some View {
        GeometryReader { proxy in
            Image(logo.rawValue + "-logo", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(height: proxy.size.height * 24 / 36)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    public init(_ logo: Logo) {
        self.logo = logo
    }
}

#Preview {
    Grid {
        Group {
            GridRow {
                CompanyLogo(.visa)
                CompanyLogo(.mastercard)
            }
        }
        .frame(width: 120, height: 36)
    }
    .padding(20)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
