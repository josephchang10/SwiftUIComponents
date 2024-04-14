//
//  ImageCard.swift
//
//
//  Created by Jiafu Zhang on 4/14/24.
//

import SwiftUI

public struct ImageCard<Image: View, Content: View>: View {
    let image: Image
    let content: Content
    
    public var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Color.clear
                    .overlay {
                        image
                    }
                    .frame(height: 260)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.1), radius: 60, y: 30)
                    .shadow(color: .black.opacity(0.5), radius: 60, y: 30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(.container(.border), lineWidth: 1)
                    }
                content
                    .padding(10)
            }
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.container(.background))
                    .fill(.ultraThinMaterial)
                glow
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .strokeBorder(.container(.border), lineWidth: 1)
            }
            .shadowBlur(.small)
            outline
        }
        .frame(minWidth: 240)
    }
    
    var outline: some View {
        RoundedRectangle(cornerRadius: 10)
            .inset(by: 0.5)
            .stroke(LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
    }
    
    var glow: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(AngularGradient(stops: [
                .init(color: .init(red: 242.0 / 255, green: 98.0 / 255, blue: 181 / 255.0).opacity(0), location: 0.35),
                .init(color: .init(red: 242.0 / 255, green: 98.0 / 255, blue: 181 / 255.0).opacity(0.2), location: 0.45),
                .init(color: .init(red: 95.0 / 255, green: 197.0 / 255, blue: 1), location: 0.54),
                .init(color: .init(red: 1, green: 172.0 / 255, blue: 137 / 255.0), location: 0.6),
                .init(color: .init(red: 129.0 / 255, green: 85.0 / 255, blue: 1), location: 0.66),
                .init(color: .init(red: 120.0 / 255, green: 157.0 / 255, blue: 1), location: 0.72),
                .init(color: .init(red: 159.0 / 255, green: 115.0 / 255, blue: 241 / 255.0).opacity(0.3), location: 0.75),
                .init(color: .init(red: 159.0 / 255, green: 115.0 / 255, blue: 241 / 255.0).opacity(0), location: 0.86)
            ], center: .init(x: 0.4, y: 0.5)))
            .blur(radius: 70)
    }
    
    public init(@ViewBuilder _ image: () -> Image, @ViewBuilder content: () -> Content) {
        self.image = image()
        self.content = content()
    }
}

#Preview {
    ImageCard {
        Image("Image Card", bundle: .module)
            .resizable()
            .scaledToFill()
    } content: {
        VStack(spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "doc.text")
                Text("Menus")
            }
            .font(.bodyMedium)
            Text("Try our free sample download to test compatibility with your design.")
                .font(.footnoteRegular)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            DividerLine()
            ButtonGlow("Browse components") {
                Image(systemName: "circle.grid.3x3.fill")
            }
        }
    }
    .frame(width: 300)
    .padding(20)
    .background(.container(.background))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}

#Preview {
    ImageCard {
        Image("Image Card", bundle: .module)
            .resizable()
            .scaledToFill()
    } content: {}
}
