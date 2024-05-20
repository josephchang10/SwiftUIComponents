//
//  AvatarSmall.swift
//
//
//  Created by Jiafu Zhang on 5/20/24.
//

import SwiftUI

public struct AvatarSmall<Avatar: View>: View {
    private let avatar: Avatar
    
    public var body: some View {
        avatar
            .background {
                Circle()
                    .fill(LinearGradient(colors: [.white.opacity(0), .white.opacity(0.52)], startPoint: .top, endPoint: .bottom))
                    .opacity(0.5)
            }
            .overlay {
                Circle()
                    .inset(by: 0.5)
                    .stroke(LinearGradient(colors: [.white.opacity(0.21), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
            }
            .shadowBlur(.small)
    }
    
    public init(@ViewBuilder avatar: () -> Avatar) {
        self.avatar = avatar()
    }
}

#Preview {
    HStack(spacing: 20) {
        AvatarSmall {
            Text("M")
                .font(.captionMedium)
                .frame(width: 24, height: 24)
        }
        .environment(\.colorScheme, .light)
        AvatarSmall {
            Text("M")
                .font(.captionMedium)
                .frame(width: 24, height: 24)
        }
        .environment(\.colorScheme, .dark)
    }
    .padding(20)
}
