//
//  BankCard.swift
//
//
//  Created by Jiafu Zhang on 5/10/24.
//

import SwiftUI

public struct BankCard<CompanyLogo: View>: View {
    public enum _Type: Int {
        case card1 = 1
        case card2
        
        var background: some ShapeStyle {
            switch self {
            case .card1:
                AnyShapeStyle(Color.black)
            case.card2:
                AnyShapeStyle(LinearGradient.gradients(.blue1))
            }
        }
        
        var patternAlignment: Alignment {
            switch self {
            case .card1:
                .bottom
            case .card2:
                .center
            }
        }
    }
    
    @Environment(\.colorScheme) private var colorScheme
    
    private let companyLogo: CompanyLogo
    private let notchLabel: String
    private let number: String
    private let type: _Type
    private let validThru: String
    
    public var body: some View {
        ZStack(alignment: .top) {
            Text(number)
                .foregroundStyle(.white)
                .font(.headlineMedium)
                .shadow(color: .black.opacity(0.25), radius: 10, y: 5)
                .padding(.top, 75)
            switch type {
            case .card1:
                row
                    .height(.full, alignment: .bottom)
            case .card2:
                valid
                    .padding(16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                companyLogo
                    .frame(width: 80, height: 24)
                    .padding(.top, 16)
                    .padding(.leading, 8)
                    .width(.full, alignment: .leading)
            }
            notch
                .height(.full, alignment: .top)
            Image("Chip\(type.rawValue)", bundle: .module)
//                .clipShape(RoundedRectangle(cornerRadius: 2.95))
//                .background {
//                    RoundedRectangle(cornerRadius: 2.95)
//                        .fill(.ultraThinMaterial)
//                }
//                .overlay {
//                    RoundedRectangle(cornerRadius: 2.95)
//                        .stroke(.white.opacity(0.5), lineWidth: 0.5)
//                }
                .padding(22)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .frame(width: 300, height: 180)
        .background(pattern, alignment: type.patternAlignment)
        .frame(minWidth: 240)
        .background(type.background)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    var notch: some View {
        ZStack {
            Image("Notch\(type.rawValue)", bundle: .module)
            Text(notchLabel)
                .foregroundStyle(.white.opacity(0.7))
                .font(.smallRegular)
        }
    }
    
    var pattern: some View {
        Pattern1()
    }
    
    var row: some View {
        HStack {
            valid
            Spacer()
            companyLogo
        }
        .padding(16)
    }
    
    var valid: some View {
        Text(validThru)
            .font(.smallRegular)
            .foregroundStyle(.white)
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .overlay {
                RoundedRectangle(cornerRadius: 6.64)
                    .inset(by: 0.5)
                    .stroke(.white.opacity(0.1), lineWidth: 1)
            }
            .background {
                if colorScheme == .light {
                    RoundedRectangle(cornerRadius: 6.64)
                        .fill(.black.opacity(0.3))
                }
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 6.64))
    }
    
    public init(_ type: _Type, number: String, validThru: String, notchLabel: String, @ViewBuilder companyLogo: () -> CompanyLogo) {
        self.type = type
        self.number = number
        self.validThru = validThru
        self.notchLabel = notchLabel
        self.companyLogo = companyLogo()
    }
}

struct BankCardView: View {
    var body: some View {
        ZStack {
            Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255)
            Grid(horizontalSpacing: 20) {
                GridRow {
                    BankCard(.card1, number: "****   ****   ****   2859", validThru: "Valid thru 06/24", notchLabel: "DEBIT CARD") {
                        CompanyLogo(.visa)
                            .frame(width: 80, height: 24)
                    }
                    BankCard(.card2, number: "****   ****   ****   2859", validThru: "Valid thru 06/24", notchLabel: "CREDIT CARD") {
                        CompanyLogo(.mastercard)
                            .frame(width: 80, height: 24)
                    }
                }
            }
            .padding(20)
            .background(.background(.secondary))
        }
        .frame(width: 1000)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    BankCardView()
}
