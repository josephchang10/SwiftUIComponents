//
//  PaymentModal.swift
//
//
//  Created by Jiafu Zhang on 4/15/24.
//

import SwiftUI

public struct PaymentModal<Content: View>: View {
    private let content: Content
    
    public var body: some View {
        VStack(spacing: 12) {
            content
        }
        .padding(12)
        .frame(minWidth: 280)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
                .fill(.ultraThinMaterial)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .strokeBorder(.container(.border), lineWidth: 1)
        }
        .shadowBlurStrong(.extraLarge)
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct PaymentModalView: View {
    @State private var email = ""
    
    var body: some View {
        PaymentModal {
            VStack(spacing: 12) {
                VStack(spacing: 0) {
                    Text("Pro Plan")
                        .font(.footnoteMedium)
                        .foregroundStyle(.foreground(.secondary))
                    HStack(spacing: 0) {
                        Text("$")
                            .font(.heading4)
                        Text("25")
                            .font(.heading1)
                    }
                    .foregroundStyle(.foreground(.primary))
                    Text("per month, billed monthly")
                        .font(.footnoteMedium)
                        .foregroundStyle(.foreground(.secondary))
                }
                Input(.large, prompt: "Email address", text: $email, showLeftIcon: true) {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                }
                Text("You will be charged $120 for a one year access. When you click on \"Subscribe\", your subscription will begin and you will be charged $120 immediately. It will renew automatically. You are also agreeing to our Terms of Service and our Privacy Policy.")
                    .font(.captionRegular)
                    .foregroundStyle(.foreground(.primary))
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                ButtonShiny(.medium, titleKey: "Subscribe") {
                    Image(systemName: "chevron.right")
                }
                DividerLine()
                Text("OR, PAY WITH PAYPAL")
                    .font(.footnoteMedium)
                    .foregroundStyle(.foreground(.primary))
                ButtonShiny(.medium, titleKey: "Pay with PayPal") {
                    Image(systemName: "chevron.right")
                }
                Text("This purchase will not auto-review. You will be taken to PayPal to complete the payment.")
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .font(.captionRegular)
                    .foregroundStyle(.foreground(.primary))
            }
            .padding(12)
        }
        .frame(width: 310)
    }
}

#Preview {
    HStack(spacing: 20) {
        PaymentModalView()
            .environment(\.colorScheme, .light)
        PaymentModalView()
            .environment(\.colorScheme, .dark)
    }
    .padding(30)
    .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
}
