//
//  ButtonPrimary.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import SwiftUI
import TailwindSwiftUI

public struct ButtonPrimary<Label: View>: View {
    public enum Size {
        case small, medium, large, extraLarge
        
        var horizontalPadding: CGFloat {
            switch self {
            case .small:
                12
            case .medium, .large:
                16
            case .extraLarge:
                20
            }
        }
        
        var verticalPadding: CGFloat {
            switch self {
            case .small:
                4
            case .medium:
                6
            case .large:
                8
            case .extraLarge:
                10
            }
        }
        
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
        
        var spacing: CGFloat {
            switch self {
            case .small, .medium:
                8
            case .large, .extraLarge:
                12
            }
        }
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    let size: Size
    private var label: Label?
    private var titleKey: LocalizedStringKey?
    var icon: AnyView?
    private let shadow: AnyViewModifier
    
    private var base: some View {
        HStack(spacing: size.spacing) {
            if let titleKey {
                Text(titleKey)
                    .padding(.vertical, 1)
            }
            if let label {
                label
            }
            icon
        }
        .foregroundStyle(.foreground(.primary))
        .font(size.font)
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
    }
    
    public var body: some View {
        switch colorScheme {
        case .dark:
            base
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(.container(.border), lineWidth: 1)
                }
                .modifier(shadow)
        default:
            base
                .background(LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom).opacity(0.5)) // highlight
                .background(.ultraThinMaterial) // keep shadows from visible
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.45, y: 0.6)).opacity(0.5), lineWidth: 1)
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(.white.opacity(0.05), lineWidth: 1)
                }
                .modifier(shadow)
        }
        
    }
    
    public init(_ size: Size, title: LocalizedStringKey, shadow: some ViewModifier = .shadowBlur(.small), @ViewBuilder icon: () -> some View) where Label == EmptyView {
        self.size = size
        self.titleKey = title
        self.shadow = AnyViewModifier(shadow)
        self.icon = AnyView(icon())
    }
    
    public init(_ size: Size, title: LocalizedStringKey, shadow: some ViewModifier = .shadowBlur(.small)) where Label == EmptyView {
        self.titleKey = title
        self.size = size
        self.shadow = AnyViewModifier(shadow)
    }
    
    public init(_ size: Size, shadow: some ViewModifier = .shadowBlur(.small), @ViewBuilder label: () -> Label, icon: () -> some View) {
        self.size = size
        self.shadow = AnyViewModifier(shadow)
        self.label = label()
        self.icon = AnyView(icon())
    }
}

#Preview {
    VStack(spacing: 10) {
        HStack(alignment: .top, spacing: 10) {
            ButtonPrimary(.small, title: "Primary") { Image(systemName: "chevron.right") }
            ButtonPrimary(.medium, title: "Primary") { Image(systemName: "chevron.right") }
            ButtonPrimary(.large, title: "Primary") { Image(systemName: "chevron.right") }
            ButtonPrimary(.extraLarge, title: "Primary") { Image(systemName: "chevron.right") }
        }
        .environment(\.colorScheme, .light)
        HStack(alignment: .top) {
            ButtonPrimary(.small, title: "Primary") { Image(systemName: "chevron.right") }
            ButtonPrimary(.medium, title: "Primary") { Image(systemName: "chevron.right") }
            ButtonPrimary(.large, title: "Primary") { Image(systemName: "chevron.right") }
            ButtonPrimary(.extraLarge, title: "Primary") { Image(systemName: "chevron.right") }
        }
        .environment(\.colorScheme, .dark)
    }
    .padding(30)
    .background(.container(.background))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
    
