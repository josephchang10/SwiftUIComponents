//
//  FiltersCard.swift
//
//
//  Created by Jiafu Zhang on 6/9/24.
//

import SwiftUI

public struct FiltersCard<Content: View>: View {
    private let content: Content
    
    public var body: some View {
        VStack(spacing: 0) {
            content
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.container(.background))
        }
        .shadowBlur(.extraLarge)
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    FiltersCard {
        HStack(alignment: .firstTextBaseline) {
            Text("Filters")
                .font(.headlineMedium)
                .width(.full, alignment: .leading)
            Text("Reset")
                .font(.bodyMedium)
        }
        .foregroundStyle(.foreground(.primary))
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
        Separator()
        HStack {
            Text("Sort by")
                .width(.full, alignment: .leading)
            Image(systemName: "chevron.down")
        }
        .font(.bodyLargeMedium)
        .foregroundStyle(.foreground(.primary))
        .padding(10)
        Separator()
        VStack(spacing: 10) {
            Text("Stops")
                .font(.bodyLargeMedium)
                .foregroundStyle(.foreground(.primary))
                .width(.full, alignment: .leading)
        }
        .padding(10)
    }
    .frame(width: 360)
    .padding(60)
}
