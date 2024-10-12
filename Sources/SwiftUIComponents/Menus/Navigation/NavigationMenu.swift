//
//  NavigationMenu.swift
//
//
//  Created by Jiafu Zhang on 4/4/24.
//

import SwiftUI

public struct NavigationMenu<LogoContent: View, MenuContent: View, ButtonsContent: View>: View {
    let logoContent: LogoContent
    let titleKey: LocalizedStringKey
    let menuContent: MenuContent
    let buttonsContent: ButtonsContent
    
    public var body: some View {
        HStack {
            left
            Spacer()
            buttons
        }
        .padding(6)
        .background(.ultraThinMaterial)
        .background(.container(.background))
        .clipShape(RoundedRectangle(cornerRadius: 99))
        .overlay{
            RoundedRectangle(cornerRadius: 99)
                .stroke(.container(.border), lineWidth: 1)
        }
        .shadowBlur(.small)
    }
    
    var logo: some View {
        HStack(spacing: 4) {
            logoContent
            Text(titleKey)
                .font(.system(size: 18))
                .bold()
        }
        .padding(4)
    }
    
    var left: some View {
        HStack(spacing: 20) {
            logo
            menu
        }
    }
    
    var menu: some View {
        HStack(spacing: 10) {
            menuContent
        }
    }
    
    var buttons: some View {
        HStack(spacing: 10) {
            buttonsContent
        }
    }
    
    public init(_ title: LocalizedStringKey, logo: Image, @ViewBuilder menu menuContent: () -> MenuContent, @ViewBuilder buttons buttonsContent: () -> ButtonsContent) where LogoContent == Image {
        self.logoContent = logo
        self.titleKey = title
        self.menuContent = menuContent()
        self.buttonsContent = buttonsContent()
    }
    
    public init(_ title: LocalizedStringKey, @ViewBuilder logo logoContent: () -> LogoContent, @ViewBuilder menu menuContent: () -> MenuContent, @ViewBuilder buttons buttonsContent: () -> ButtonsContent) {
        self.logoContent = logoContent()
        self.titleKey = title
        self.menuContent = menuContent()
        self.buttonsContent = buttonsContent()
    }
}

struct NavigationMenuView: View {
    var body: some View {
        NavigationMenu("Company") {
            Image(systemName: "rays")
                .resizable()
                .scaledToFit()
                .fontWeight(.bold)
                .frame(width: 24, height: 24)
                .padding(3)
        } menu: {
            ButtonToggle(.medium, text: "Product", showRightIcon: false, font: .footnoteMedium)
            ButtonToggle(.medium, text: "Pricing", showRightIcon: false, font: .footnoteMedium)
            ButtonToggle(.medium, text: "Changelog", showRightIcon: false, font: .footnoteMedium)
        } buttons: {
            ButtonToggle(.medium, text: "Log in", showRightIcon: false, font: .footnoteMedium)
            ButtonToggle(.medium, text: "Sign up", state: .selected, showRightIcon: false)
                .shadowBlur(.small)
        }
        .frame(width: 780)
    }
}

#Preview {
    VStack(spacing: 20) {
        NavigationMenuView()
            .environment(\.colorScheme, .light)
        NavigationMenuView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .padding(60)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
    .preferredColorScheme(.light)
}
