//
//  SwiftUIComponentsView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/5/24.
//

import SwiftUI
import SwiftUIComponents

struct SwiftUIComponentsView: View {
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                HeroView()
            }
            NavigationMenu("SwiftUI Components", logo: Image(systemName: "square.on.square.intersection.dashed")) {
                ButtonToggle("Components", showRightIcon: false, font: .footnoteMedium) {}
                ButtonToggle("Pricing", showRightIcon: false, font: .footnoteMedium) {}
                ButtonToggle("Changelog", showRightIcon: false, font: .footnoteMedium) {}
            } buttons: {
                ButtonToggle("Log in", showRightIcon: false, font: .footnoteMedium) {}
                ButtonToggle("Buy now", style: .glass, showRightIcon: false, font: .footnoteMedium) {}
                    .shadowBlur(.small)
            }
            .frame(minWidth: 720, maxWidth: 860)
            .padding(.top, 40)
        }
        .frame(width: 1440)
        .preferredColorScheme(.light)
    }
}

struct HeroView: View {
    var body: some View {
        ZStack {
            BackgroundWeb1()
                .frame(width: 1440, height: 1440)
                .ignoresSafeArea()
            content
        }
    }
    
    var content: some View {
        HStack(spacing: 20) {
            textBlock
            components
        }
        .padding(.top, 96)
    }
    
    var textBlock: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 20) {
                    ButtonPrimary("Buy at 50% off", icon: Image(systemName: "chevron.right")) {}
                    Text("Build a beautiful, funcitonal app with SwiftUI components")
                        .font(.heading3)
                }
                Spacer()
                Toggle(isVertical: true) {
                    ButtonCircle {
                        Image(systemName: "moon")
                    } action: {}
                    ButtonCircle(state: .selected) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    } action: {}
                    ButtonCircle {
                        Image(systemName: "sun.max")
                    } action: {}
                }
            }
            Text("A vast, dynamic design system with hundreds of customizable UI components and templates, ready for SwiftUI deployment and meticulously organized with parameters, variants and adaptive layouts. Made from decades of pushing pixels.")
                .font(.bodyRegular)
                .foregroundStyle(.foreground(.secondary))
            HStack(spacing: 10) {
                ButtonLogo {
                    Image("Xcode Logo")
                        .resizable()
                        .scaledToFit()
                }
                ButtonLogo {
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .padding(3)
                }
            }
            ButtonShiny("Preview in Xcode", showLeftIcon: true, showRightIcon: false) {
                Image("Xcode Logo")
                    .resizable()
                    .scaledToFit()
            } action: {}
            ButtonShiny("SwiftUI Template", showLeftIcon: true, showRightIcon: false) {
                Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .padding(2)
            } action: {}
        }
        .frame(minWidth: 335, maxWidth: 500)
    }
    
    var components: some View {
        VStack(spacing: 30) {
            HStack(spacing: 30) {
                
            }
        }
    }
}

#Preview {
    SwiftUIComponentsView()
}
