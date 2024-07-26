//
//  Input.swift
//
//
//  Created by Jiafu Zhang on 4/15/24.
//

import SwiftUI

public struct Input: View {
    public enum Size {
        case small
        case medium
        case large
        case extraLarge
        
        var horizontalSpacing: CGFloat {
            switch self {
            case .small, .medium:
                8
            case .large, .extraLarge:
                12
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
    }
    
    @Environment(\.colorScheme) private var colorScheme
    let prompt: LocalizedStringKey
    let text: Binding<String>
    let icon: AnyView?
    let showLeftIcon: Bool
    let showRightIcon: Bool
    let axis: Axis
    var background: AnyShapeStyle?
    var border: AnyShapeStyle?
    let size: Size
    
    public var body: some View {
        HStack(spacing: size.horizontalSpacing) {
            if showLeftIcon {
                icon
            }
            TextField("", text: text, prompt: Text(prompt).font(.captionRegular), axis: axis)
                .textFieldStyle(.plain)
//                .overlay(alignment: .leading) {
//                    if text.wrappedValue.isEmpty {
//                        Text(prompt)
//                            .font(.captionRegular)
//                            .allowsHitTesting(false)
//                    }
//                }
            if showRightIcon {
                icon
            }
        }
        .padding(.leading, 12)
        .padding(.vertical, size.verticalPadding)
        .padding(.trailing, 8)
        .frame(minHeight: 32) // TODO: Make this dynamic
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(background ?? AnyShapeStyle(LinearGradient(colors: [
                .white.opacity(colorScheme == .dark ? 1 : 0.5),
                .white.opacity(colorScheme == .dark ? 0.5 : 0.05)
            ], startPoint: .bottom, endPoint: .top).opacity(colorScheme == .dark ? 0.1 : 1)))
        }
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.ultraThinMaterial)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(border ?? AnyShapeStyle(LinearGradient(colors: [
                    .white.opacity(0.5),
                    .white.opacity(0)
                ], startPoint: .bottom, endPoint: .top).opacity(colorScheme == .dark ? 0.1 : 1)), lineWidth: 1)
                .strokeBorder(.white.opacity(0.1), lineWidth: 1)
        }
        .shadowBlur(.small)
//        .frame(minWidth: 140, maxWidth: 500)
    }
    
    public init(_ size: Size, prompt: LocalizedStringKey = "", text: Binding<String>, showLeftIcon: Bool = false, showRightIcon: Bool = true, @ViewBuilder icon: () -> some View) {
        self.size = size
        self.prompt = prompt
        self.text = text
        self.icon = AnyView(icon())
        self.showLeftIcon = showLeftIcon
        self.showRightIcon = showRightIcon
        axis = .horizontal
    }
    
    public init(_ size: Size, prompt: LocalizedStringKey = "", text: Binding<String>, showLeftIcon: Bool = false, showRightIcon: Bool = true, background: some ShapeStyle, border: some ShapeStyle, @ViewBuilder icon: () -> some View) {
        self.size = size
        self.prompt = prompt
        self.text = text
        self.icon = AnyView(icon())
        self.showLeftIcon = showLeftIcon
        self.showRightIcon = showRightIcon
        self.background = AnyShapeStyle(background)
        self.border = AnyShapeStyle(border)
        axis = .horizontal
    }
    
    public init(_ size: Size, prompt: LocalizedStringKey, text: Binding<String>, showLeftIcon: Bool, @ViewBuilder icon: () -> some View) {
        self.size = size
        self.prompt = prompt
        self.text = text
        self.icon = AnyView(icon())
        self.showLeftIcon = showLeftIcon
        showRightIcon = false
        axis = .horizontal
    }
    
    public init(_ size: Size, prompt: LocalizedStringKey, text: Binding<String>, axis: Axis = .horizontal) {
        self.size = size
        self.prompt = prompt
        self.text = text
        self.icon = nil
        self.showLeftIcon = false
        self.showRightIcon = false
        self.axis = axis
    }
}

struct InputView: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Input(.small, prompt: "Email address", text: $text) {
                IconCircle {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.bold)
                        .frame(width: 16, height: 16)
                }
            }
            Input(.medium, prompt: "Email address", text: $text) {
                IconCircle {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.bold)
                        .frame(width: 16, height: 16)
                }
            }
            Input(.large, prompt: "Email address", text: $text) {
                IconCircle {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.bold)
                        .frame(width: 16, height: 16)
                }
            }
            Input(.extraLarge, prompt: "Email address", text: $text) {
                IconCircle {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.bold)
                        .frame(width: 16, height: 16)
                }
            }
        }
        .frame(width: 200)
    }
}

#Preview {
    VStack(spacing: 20) {
        InputView()
            .environment(\.colorScheme, .light)
        InputView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .background(Color(red: 53/255, green: 53/255, blue: 53/255))
}
