//
//  TextButton.swift
//  SwiftUIComponents
//
//  Created by Jiafu Zhang on 10/12/24.
//

import SwiftUI

public struct TextButton<ImageView: View>: View {
    public enum Size {
        case small
        case medium
        case large
        case extraLarge
        
        var font: Font {
            switch self {
            case .small, .medium:
                .captionMedium
            case .large:
                .footnoteMedium
            case .extraLarge:
                .bodyMedium
            }
        }
        
        var padding: EdgeInsets {
            switch self {
            case .small:
                .init(top: 4, leading: 12, bottom: 4, trailing: 12)
            case .medium:
                .init(top: 6, leading: 16, bottom: 6, trailing: 16)
            case .large:
                .init(top: 8, leading: 16, bottom: 8, trailing: 16)
            case .extraLarge:
                .init(top: 10, leading: 20, bottom: 10, trailing: 20)
            }
        }
        
        var spacing: CGFloat {
            switch self {
            case .small, .medium:
                8
            case .large, .extraLarge:
                12
            }
        }
    }
    
    let size: Size
    let titleKey: LocalizedStringKey
    let image: Image?
    let imageView: ImageView?
    
    public var body: some View {
        HStack(spacing: size.spacing) {
            Text(titleKey)
            image
            imageView
        }
        .font(size.font)
        .padding(size.padding)
    }
    
    public init(_ size: Size, _ titleKey: LocalizedStringKey, image: Image) where ImageView == EmptyView {
        self.size = size
        self.titleKey = titleKey
        self.image = image
        self.imageView = nil
    }
    
    public init(_ size: Size, _ titleKey: LocalizedStringKey, systemImage: String) where ImageView == EmptyView {
        self.size = size
        self.titleKey = titleKey
        self.image = .init(systemName: systemImage)
        self.imageView = nil
    }
    
    
    public init(_ size: Size, _ titleKey: LocalizedStringKey, @ViewBuilder image: () -> ImageView) {
        self.size = size
        self.titleKey = titleKey
        self.image = nil
        self.imageView = image()
    }
}

struct TextButtonView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            TextButton(.small, "Components", systemImage: "doc.on.doc")
            TextButton(.medium, "Components", systemImage: "doc.on.doc")
            TextButton(.large, "Components", systemImage: "doc.on.doc")
            TextButton(.extraLarge, "Components", systemImage: "doc.on.doc")
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        TextButtonView()
            .environment(\.colorScheme, .light)
        TextButtonView()
            .environment(\.colorScheme, .dark)
    }
    .padding(60)
    .fixedSize()
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
