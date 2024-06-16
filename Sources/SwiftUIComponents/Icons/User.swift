//
//  User.swift
//  
//
//  Created by Jiafu Zhang on 6/16/24.
//

import SwiftUI

public extension Icon {
    enum User: String {
        case userSettings
    }
}

struct UserView: View {
    var body: some View {
        Icon(.user(.userSettings))
            .frame(width: 24, height: 24)
    }
}

#Preview {
    UserView()
        .padding(60)
}
