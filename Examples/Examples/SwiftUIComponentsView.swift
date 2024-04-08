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
                ButtonToggle("Components", .medium, showRightIcon: false, font: .footnoteMedium) {}
                ButtonToggle("Pricing", .medium, showRightIcon: false, font: .footnoteMedium) {}
                ButtonToggle("Changelog", .medium, showRightIcon: false, font: .footnoteMedium) {}
            } buttons: {
                ButtonToggle("Log in", .medium, showRightIcon: false, font: .footnoteMedium) {}
                ButtonToggle("Buy now", .medium, style: .glass, showRightIcon: false, font: .footnoteMedium) {}
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
        .padding(96)
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
                TemplateCard {
                    ZStack(alignment: .topLeading) {
                        Color.clear
                            .frame(height: 200)
                            .overlay {
                                Image("Image")
                                    .resizable()
                                    .scaledToFill()
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .inset(by: 0.5)
                                    .stroke(LinearGradient(stops: [
                                        .init(color: .white, location: 0),
                                        .init(color: .white.opacity(0), location: 0.48),
                                        .init(color: .white, location: 1)
                                    ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                    .stroke(.white.opacity(0.1), lineWidth: 1)
                                    .blendMode(.overlay)
                            }
                            .compositingGroup()
                            .shadow(color: .black.opacity(0.1), radius: 60, y: 30)
                            .shadow(color: .black.opacity(0.5), radius: 60, y: 30)
                        ButtonLogo {
                            Image(systemName: "swift")
                        }
                        .padding(10)
                    }
                } content: {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 8) {
                            Image(systemName: "circle.dotted")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .fontWeight(.black)
                            Text("New update")
                                .font(.captionRegular)
                                .foregroundStyle(.foreground(.secondary))
                            Spacer()
                            HStack(spacing: 0) {
                                ButtonIcon {
                                    Image(systemName: "arrow.left")
                                }
                                .disabled(true)
                                Separator()
                                ButtonIcon {
                                    Image(systemName: "arrow.right")
                                }
                            }
                            .fixedSize(horizontal: false, vertical: true)
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .inset(by: 0.5)
                                    .stroke(.container(.divider), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            }
                        }
                        DividerLine()
                        Text("UI Templates")
                            .font(.footnoteMedium)
                        Text("Introducing a collection of fully designed and functional components, tailored to enhance...")
                            .font(.captionRegular)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .width(.full, alignment: .leading)
                        DividerLine()
                        ButtonGlow("Browse templates") {
                            Image(systemName: "circle.hexagongrid")
                        } action: {}
                    }
                    .padding(10)
                }
            }
        }
    }
}

#Preview {
    SwiftUIComponentsView()
}
