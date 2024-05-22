//
//  Testimonial.swift
//
//
//  Created by Jiafu Zhang on 5/20/24.
//

import SwiftUI

public struct Testimonial<Content: View, Logo: View>: View {
    private let content: Content
    private let logo: Logo
    
    public var body: some View {
        content
        .padding(30)
        .background(.container(.background))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
//                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
        .background(glow)
        .overlay(alignment: .topTrailing) {
            Image("TestimonialLine", bundle: .module)
        }
        .overlay(alignment: .topTrailing) {
            logo
                .padding(30)
        }
        .frame(minWidth: 280)
    }
    
    var glow: some View {
        AngularGradient(stops: [
            .init(color: .init(red: 242.0 / 255, green: 98.0 / 255, blue: 181.0 / 255, opacity: 0), location: 0.35),
            .init(color: .init(red: 242.0 / 255, green: 98.0 / 255, blue: 181.0 / 255, opacity: 1), location: 0.5),
            .init(color: .init(red: 95.0 / 255, green: 197.0 / 255, blue: 1), location: 0.54),
            .init(color: .init(red: 1, green: 172.0 / 255, blue: 137.0 / 255), location: 0.6),
            .init(color: .init(red: 129.0 / 255, green: 85.0 / 255, blue: 1), location: 0.66),
            .init(color: .init(red: 120.0 / 255, green: 157.0 / 255, blue: 1), location: 0.72),
            .init(color: .init(red: 159.0 / 255, green: 115.0 / 255, blue: 241.0 / 255), location: 0.86),
            .init(color: .init(red: 159.0 / 255, green: 115.0 / 255, blue: 241.0 / 255, opacity: 0), location: 0.9)
        ], center: .init(x: 0.4, y: 0.5), angle: .degrees(200))
        .opacity(0.3)
        .blur(radius: .point(50))
    }
    
    public init(@ViewBuilder content: () -> Content, @ViewBuilder logo: () -> Logo) {
        self.content = content()
        self.logo = logo()
    }
}

struct TestimonialView: View {
    var body: some View {
        Testimonial {
            VStack(alignment: .leading, spacing: 20) {
                Toggle {
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "moon")
                    }
                    ButtonCircle(.small) {
                        Image(systemName: "sun.max")
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Mobbin")
                        .font(.bodyMedium)
                    Text("Mobile & web design references")
                        .font(.footnoteMedium)
                        .foregroundStyle(.foreground(.secondary))
                    DividerLine()
                    Text("Built with the latest Figma and Framer features, the meticulously crafted, fully customisable components will turbocharge your design workflow, ensuring seamless consistency and efficiency in all your projects.")
                        .font(.footnoteRegular)
                        .foregroundStyle(.foreground(.secondary))
                        .fixedSize(horizontal: false, vertical: true)
                    DividerLine()
                    HStack(spacing: 8) {
                        AvatarSmall {
                            Text("J")
                                .font(.captionMedium)
                                .frame(width: 24, height: 24)
                        }
                        Text("Jiho Lim, Creator of Mobbin")
                            .font(.footnoteMedium)
                            .foregroundStyle(.foreground(.secondary))
                    }
                }
            }
        } logo: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(colors: [.white.opacity(0), .white.opacity(0.52)], startPoint: .top, endPoint: .bottom).opacity(0.5))
                    .padding(7)
                    .rotationEffect(.degrees(45))
                    .shadowBlur(.small)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(colors: [.white.opacity(0), .white], startPoint: .bottomTrailing, endPoint: .topLeading), lineWidth: 1)
                    .padding(7)
                    .rotationEffect(.degrees(45))
                    .blendMode(.overlay)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white.opacity(0.1), lineWidth: 1)
                    .padding(7)
                    .rotationEffect(.degrees(45))
                    .blendMode(.overlay)
                Logo(.x)
                    .frame(width: 24, height: 24)
            }
            .frame(width: 44, height: 44)
        }
        .frame(width: 300)
    }
}

#Preview {
    HStack(spacing: 20) {
        TestimonialView()
            .environment(\.colorScheme, .light)
        TestimonialView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
//    .background(.container(.background))
    .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
}
