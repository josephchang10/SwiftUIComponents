//
//  Newsletter.swift
//
//
//  Created by Jiafu Zhang on 6/15/24.
//

import SwiftUI

public struct Newsletter<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    private let content: Content
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            content
        }
        .padding(20)
        .frame(minWidth: 240)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
        .shadowBlur(.extraLarge)
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct NewsletterView: View {
    @State private var email = "Email address"
    
    var body: some View {
        Newsletter {
            VStack(alignment: .leading, spacing: 8) {
                Text("Subscribe via Email")
                    .font(.heading5)
                    .width(.full, alignment: .leading)
                    .foregroundStyle(.textGradient(.secondary))
                    .shadow(color: .black.opacity(0.5), radius: 60, y: 30)
                Text("We release monthly updates to the content an make regular site improvements.")
                    .font(.footnoteMedium)
                    .foregroundStyle(.foreground(.secondary))
            }
            Input(.small, text: $email) {
                IconCircle {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.bold)
                        .frame(width: 16, height: 16)
                }
            }
            ButtonPrimary(.small, title: "Subscribe to Newsletter") {
                Image(systemName: "tray")
            }
            Text("No spam ever. We typically send 1 email per month for product updates, events and discounts.")
                .font(.captionRegular)
                .fixedSize(horizontal: false, vertical: true)
            DividerLine()
            ButtonSecondary(.small, title: "Subscribe to YouTube") {
                Logo(.youtube)
            }
            ButtonSecondary(.small, title: "Follow on") {
                Logo(.x)
            }
        }
        .frame(width: 320)
    }
}

#Preview {
    HStack(spacing: 20) {
        NewsletterView()
            .environment(\.colorScheme, .light)
        NewsletterView()
            .environment(\.colorScheme, .dark)
    }
    .padding(60)
//    .background(.container(.background))
    .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
}
