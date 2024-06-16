//
//  Icon.swift
//
//
//  Created by Jiafu Zhang on 6/16/24.
//

import SwiftUI

public struct Icon: View {
    public enum Icon {
        case files(Files)
        case user(User)
        
        var name: String {
            switch self {
            case .files(let files):
                files.rawValue.camelCaseToWords()
            case let .user(user):
                user.rawValue.camelCaseToWords()
            }
        }
    }
    
    private let icon: Icon
    
    public var body: some View {
        Image(icon.name, bundle: .module)
            .resizable()
            .foregroundStyle(.foreground(.primary))
            .scaledToFit()
    }
    
    public init(_ icon: Icon) {
        self.icon = icon
    }
}

fileprivate extension String {
    func camelCaseToWords() -> Self {
        unicodeScalars.dropFirst().reduce(prefix(1).uppercased()) {
            CharacterSet.uppercaseLetters.contains($1)
                ? $0 + " " + String($1)
                : $0 + String($1)
        }
    }
}
