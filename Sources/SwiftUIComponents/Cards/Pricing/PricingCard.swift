//
//  PricingCard.swift
//
//
//  Created by Jiafu Zhang on 4/15/24.
//

import SwiftUI

public struct PricingCard<Content: View>: View {
    let content: Content
    
    public var body: some View {
        VStack(spacing: 20) {
            content
        }
        .padding(20)
        .frame(minWidth: 240, maxWidth: 300)
        .background {
            glow
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .strokeBorder(.container(.border), lineWidth: 1)
        }
        .shadowBlur(.extraLarge)
    }
    
    var glow: some View {
        AngularGradient(stops: [
            .init(color: .init(red: 242.0 / 255, green: 98.0 / 255, blue: 181.0 / 255).opacity(0), location: 0.35),
            .init(color: .init(red: 242.0 / 255, green: 98.0 / 255, blue: 181.0 / 255).opacity(0.15), location: 0.46),
            .init(color: .init(red: 95.0 / 255, green: 197.0 / 255, blue: 1), location: 0.54),
            .init(color: .init(red: 1, green: 172.0 / 255, blue: 137.0 / 255), location: 0.6),
            .init(color: .init(red: 129.0 / 255, green: 85.0 / 255, blue: 1), location: 0.66),
            .init(color: .init(red: 120.0 / 255, green: 157.0 / 255, blue: 1), location: 0.72),
            .init(color: .init(red: 159.0 / 255, green: 115.0 / 255, blue: 241.0 / 255).opacity(0.2), location: 0.8),
            .init(color: .init(red: 159.0 / 255, green: 115.0 / 255, blue: 241.0 / 255).opacity(0), location: 0.86)
        ], center: .init(x: 0.4, y: 0.5), angle: .degrees(90))
        .blur(radius: .point(40))
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    HStack(spacing: 20) {
        PricingCard {
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    Text("All-Access")
                        .font(.footnoteMedium)
                    HStack(spacing: 4) {
                        Text("$")
                            .font(.heading4)
                            .foregroundStyle(.foreground(.secondary))
                        Text("99")
                            .font(.heading1)
                            .foregroundStyle(.foreground(.primary))
                    }
                    Text("One-time")
                        .font(.captionRegular)
                        .foregroundStyle(.foreground(.tertiary))
                }
                DividerLine()
                VStack(alignment: .leading, spacing: 8) {
                    TextCheck("All 300+ components")
                    TextCheck("2,000+ SwiftUI variants")
                    TextCheck("2,116 unique icons")
                }
                .frame(width: 220)
                DividerLine()
                ButtonShiny("Buy now", .medium) {
                    Image(systemName: "creditcard")
                }
            }
            .padding(10)
        }
        .frame(width: 280)
        .environment(\.colorScheme, .light)
        PricingCard {
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    Text("All-Access")
                        .font(.footnoteMedium)
                    HStack(spacing: 4) {
                        Text("$")
                            .font(.heading4)
                            .foregroundStyle(.foreground(.secondary))
                        Text("99")
                            .font(.heading1)
                            .foregroundStyle(.foreground(.primary))
                    }
                    Text("One-time")
                        .font(.captionRegular)
                        .foregroundStyle(.foreground(.tertiary))
                }
                DividerLine()
                VStack(alignment: .leading, spacing: 8) {
                    TextCheck("All 300+ components")
                    TextCheck("2,000+ SwiftUI variants")
                    TextCheck("2,116 unique icons")
                }
                .frame(width: 220)
                DividerLine()
                ButtonShiny("Buy now", .medium) {
                    Image(systemName: "creditcard")
                }
            }
            .padding(10)
        }
        .frame(width: 280)
        .environment(\.colorScheme, .dark)
    }
    .padding(30)
    .background(.container(.background))
    .background(Color(red: 30/255, green: 30/255, blue: 30/255))
}
