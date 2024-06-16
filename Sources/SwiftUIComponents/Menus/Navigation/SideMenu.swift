//
//  SideMenu.swift
//
//
//  Created by Jiafu Zhang on 6/16/24.
//

import SwiftUI

public struct SideMenu<Content: View>: View {
    private let content: Content
    
    public var body: some View {
        VStack(spacing: 4) {
            content
        }
        .padding(16)
        .frame(minWidth: 160, maxWidth: 320)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.container(.background))
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
            ], center: .center, angle: .degrees(230)).opacity(0.7))
            .blur(radius: .point(100))
    }
    
    var outline: some View {
        RoundedRectangle(cornerRadius: 10)
            .inset(by: 0.5)
            .stroke(LinearGradient(colors: [
                .white.opacity(0),
                .white
            ], startPoint: .top, endPoint: .bottom))
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct SideMenuView: View {
    var body: some View {
        SideMenu {
            ButtonMenu(.large, text: "Account") {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .fontWeight(.bold)
            }
            DividerLine()
            ButtonMenu(.large, text: "Pricing", state: .selected) {
                Image(systemName: "creditcard")
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .fontWeight(.bold)
            }
            DividerLine()
            ButtonMenu(.large, text: "Billing") {
                Image(systemName: "doc.plaintext")
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .fontWeight(.bold)
            }
            DividerLine()
            ButtonMenu(.large, text: "Settings") {
                Image(systemName: "person.2.badge.gearshape")
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .fontWeight(.bold)
            }
            DividerLine()
            ButtonMenu(.large, text: "Support") {
                Image(systemName: "questionmark.diamond")
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .fontWeight(.bold)
            }
            DividerLine()
            ButtonMenu(.large, text: "Contact") {
                Image(systemName: "envelope")
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .fontWeight(.bold)
            }
            DividerLine()
            ButtonMenu(.large, text: "Sign Out") {
                Image(systemName: "arrow.left.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .fontWeight(.bold)
            }
        }
        .frame(width: 200)
    }
}

#Preview {
    HStack(spacing: 20) {
        SideMenuView()
            .environment(\.colorScheme, .light)
        SideMenuView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .padding(60)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
