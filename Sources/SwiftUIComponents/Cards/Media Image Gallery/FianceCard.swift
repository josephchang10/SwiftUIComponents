//
//  FianceCard.swift
//
//
//  Created by Jiafu Zhang on 6/16/24.
//

import SwiftUI

public struct FianceCard<Content: View>: View {
    private let content: Content
    
    public var body: some View {
        VStack(spacing: 10) {
            content
        }
        .padding(20)
        .frame(minWidth: 280)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
                .fill(.ultraThinMaterial)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
        .background {
            glow
            outline
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
    
    var outline: some View {
        RoundedRectangle(cornerRadius: 10)
            .inset(by: 0.5)
            .stroke(LinearGradient(colors: [
                .white,
                .white.opacity(0)
            ], startPoint: .top, endPoint: .bottom))
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct FinanceCardView: View {
    var body: some View {
        FianceCard {
            BankCard(.card1, number: "****   ****   ****   2859", validThru: "Valid thru 06/24", notchLabel: "DEBIT CARD") {
                CompanyLogo(.visa)
                    .frame(width: 80, height: 24)
            }
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 10) {
                    Image(systemName: "creditcard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundStyle(.foreground(.primary))
                    Text("All your cards in one place")
                        .font(.footnoteRegular)
                        .foregroundStyle(.foreground(.secondary))
                }
                Text("Smart cards")
                    .font(.heading5)
                    .foregroundStyle(.foreground(.primary))
                Text("Make your finances work for you with the power of AI. From tracking expenses to planning investments, gain insights.")
                    .font(.footnoteRegular)
                    .foregroundStyle(.foreground(.secondary))
                    .fixedSize(horizontal: false, vertical: true)
                DividerLine()
                HStack {
                    ButtonGlow(.small, text: "Add card") {
                        Image(systemName: "plus.circle")
                    }
                    Spacer()
                    HStack(spacing: 0) {
                        ButtonIcon(.medium) {
                            Image(systemName: "arrow.left")
                        }
                        Separator()
                        ButtonIcon(.medium) {
                            Image(systemName: "arrow.right")
                        }
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .inset(by: 0.5)
                            .stroke(.container(.divider), lineWidth: 1)
                    }
                }
            }
            .width(.full, alignment: .leading)
            .padding(10)
        }
        .frame(width: 340)
    }
}

#Preview {
    HStack(spacing: 20) {
        FinanceCardView()
            .environment(\.colorScheme, .light)
        FinanceCardView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .padding(60)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
