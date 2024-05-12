//
//  TemplateCard.swift
//
//
//  Created by Jiafu Zhang on 4/7/24.
//

import SwiftUI

public struct TemplateCard<Image: View, Content: View>: View {
    let image: Image
    let content: Content
    
    public var body: some View {
        VStack(spacing: 10) {
            image
            content
        }
        .padding(10)
        .frame(minWidth: 240)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.thinMaterial)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
        .shadowBlur(.extraLarge)
        .background {
            glow
        }
    }
    
    var glow: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(AngularGradient(stops: [
                .init(color: .init(red: 242.0 / 255, green: 98.0 / 255, blue: 181.0 / 255, opacity: 0), location: 0.35),
                .init(color: .init(red: 95.0 / 255, green: 197.0 / 255, blue: 1), location: 0.54),
                .init(color: .init(red: 1, green: 172.0 / 255, blue: 137.0 / 255), location: 0.6),
                .init(color: .init(red: 129.0 / 255, green: 85.0 / 255, blue: 1), location: 0.66),
                .init(color: .init(red: 120.0 / 255, green: 157.0 / 255, blue: 1), location: 0.72),
                .init(color: .init(red: 159.0 / 255, green: 115.0 / 255, blue: 241.0 / 255, opacity: 0), location: 0.86)
            ], center: .center).opacity(0.7))
            .blur(radius: .point(70))
    }
    
    public init(@ViewBuilder image: () -> Image, content: () -> Content) {
        self.image = image()
        self.content = content()
    }
}

#Preview {
    TemplateCard {
        ZStack(alignment: .topLeading) {
            Color.clear
                .frame(height: 200)
                .overlay {
                    Image("Image", bundle: .module)
                        .resizable()
                        .scaledToFill()
                }
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.5)
                        .stroke(LinearGradient(stops: [
                            .init(color: .white, location: 0),
                            .init(color: .white.opacity(0), location: 0.48),
                            .init(color: .white, location: 1)
                        ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .stroke(.white.opacity(0.1), lineWidth: 1)
                        .blendMode(.overlay)
                }
                .compositingGroup()
                .shadow(color: .black.opacity(0.1), radius: 60, y: 30)
                .shadow(color: .black.opacity(0.5), radius: 60, y: 30)
            ButtonLogo {
                Image(systemName: "swift")
            }
            .padding(10)
        }
    } content: {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "circle.dotted")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .fontWeight(.black)
                Text("New update")
                    .font(.captionRegular)
                    .foregroundStyle(.foreground(.secondary))
                Spacer()
                HStack(spacing: 0) {
                    ButtonIcon(.small) {
                        Image(systemName: "arrow.left")
                    }
                    .disabled(true)
                    Separator()
                    ButtonIcon(.small) {
                        Image(systemName: "arrow.right")
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .inset(by: 0.5)
                        .stroke(.container(.divider), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }
            }
            DividerLine()
            Text("UI Templates")
                .font(.footnoteMedium)
            Text("Introducing a collection of fully designed and functional components, tailored to enhance...")
                .font(.captionRegular)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .width(.full, alignment: .leading)
            DividerLine()
            ButtonGlow("Browse templates") {
                Image(systemName: "circle.hexagongrid")
            }
        }
        .padding(10)
    }
    .frame(width: 260)
    .padding(20)
    .environment(\.colorScheme, .light)
}
