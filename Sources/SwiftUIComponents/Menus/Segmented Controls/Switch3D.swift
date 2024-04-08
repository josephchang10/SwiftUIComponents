//
//  Switch3D.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct Switch3D: View {
    let text1: LocalizedStringKey
    let text2: LocalizedStringKey
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            toggle
            Text(text1)
                .shadow(color: .white, radius: 8)
                .shadow(color: .white, radius: 16)
                .offset(x: 21, y: 14)
            Text(text2)
                .offset(x: 95, y: 14)
        }
    }
    
    var toggle: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
            RoundedRectangle(cornerRadius: 6)
                .fill(LinearGradient(stops: [
                    .init(color: .white.opacity(1), location: 0),
                    .init(color: .white, location: 0.08),
                    .init(color: .black.opacity(0), location: 1)
                ], startPoint: .trailing, endPoint: .leading).opacity(0.5))
                .fill(LinearGradient(colors: [.white.opacity(0.3), .init(red: 12 / 255, green: 16 / 255, blue: 20 / 255, opacity: 0)], startPoint: .top, endPoint: .bottom).opacity(0.9))
                .frame(width: 148, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.5)
                        .stroke(LinearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .top, endPoint: .bottom), lineWidth: 1)
                }
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.black.opacity(0.5))
                        .blur(radius: 4)
                        .offset(y: 4)
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.black.opacity(0.5))
                        .blur(radius: 20)
                        .offset(y: 20)
                }
                .padding(.top, 6)
                .padding(.leading, 7)
            RoundedRectangle(cornerRadius: 6)
                .fill(LinearGradient(stops: [
                    .init(color: .white.opacity(0.5), location: 0),
                    .init(color: .white.opacity(0.25), location: 0.49),
                    .init(color: .white.opacity(0.4), location: 0.55),
                    .init(color: .white.opacity(0.6), location: 1)
                ], startPoint: .trailing, endPoint: .leading).opacity(0.9))
                .frame(width: 138, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.5)
                        .stroke(LinearGradient(stops: [
                            .init(color: .white.opacity(0.5), location: 0),
                            .init(color: .white.opacity(0), location: 0.46)
                        ], startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1)
                }
                .padding(.top, 6)
                .padding(.leading, 7)
        }
        .frame(width: 160, height: 44)
    }
    
    public init(text1: LocalizedStringKey, text2: LocalizedStringKey) {
        self.text1 = text1
        self.text2 = text2
    }
}

#Preview {
    Switch3D(text1: "Monthly", text2: "Yearly")
        .padding()
        .background(.container(.background))
        .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
