//
//  NavigationMenu.swift
//  
//
//  Created by Jiafu Zhang on 4/4/24.
//

import SwiftUI

public struct NavigationMenu<MenuContent: View, ButtonsContent: View>: View {
    let logoImage: Image
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
            logoImage
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
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
    
    public init(_ title: LocalizedStringKey, logo: Image, @ViewBuilder menu menuContent: () -> MenuContent, @ViewBuilder buttons buttonsContent: () -> ButtonsContent) {
        self.logoImage = logo
        self.titleKey = title
        self.menuContent = menuContent()
        self.buttonsContent = buttonsContent()
    }
}

#Preview {
    NavigationMenu("Company", logo: Image(systemName: "rays")) {
        ButtonToggle(.medium, text: "Product", showRightIcon: false, font: .footnoteMedium)
        ButtonToggle(.medium, text: "Pricing", showRightIcon: false, font: .footnoteMedium)
        ButtonToggle(.medium, text: "Changelog", showRightIcon: false, font: .footnoteMedium)
    } buttons: {
        ButtonToggle(.medium, text: "Log in", showRightIcon: false, font: .footnoteMedium)
        ButtonToggle(.medium, text: "Sign up", style: .glass, showRightIcon: false)
            .shadowBlur(.small)
    }
    .padding(20)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
