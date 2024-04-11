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
                ButtonToggle("Components", .medium, showRightIcon: false, font: .footnoteMedium)
                ButtonToggle("Pricing", .medium, showRightIcon: false, font: .footnoteMedium)
                ButtonToggle("Changelog", .medium, showRightIcon: false, font: .footnoteMedium)
            } buttons: {
                ButtonToggle("Log in", .medium, showRightIcon: false, font: .footnoteMedium)
                ButtonToggle("Buy now", .medium, style: .glass, showRightIcon: false, font: .footnoteMedium)
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
            ComponentsView()
        }
        .padding(96)
    }
    
    var textBlock: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 20) {
                    ButtonPrimary("Buy at 50% off", .small) { Image(systemName: "chevron.right") } action: {}
                    Text("Build a beautiful, funcitonal app with SwiftUI components")
                        .font(.heading3)
                }
                Spacer()
                Toggle(isVertical: true) {
                    ButtonCircle(.small) {
                        Image(systemName: "moon")
                    } action: {}
                    ButtonCircle(.small, state: .selected) {
                        Image(systemName: "display")
                            .symbolRenderingMode(.monochrome)
                    } action: {}
                    ButtonCircle(.small) {
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
            ButtonShiny("Preview in Xcode", .large, showLeftIcon: true, showRightIcon: false) {
                Image("Xcode Logo")
                    .resizable()
                    .scaledToFit()
            } action: {}
            ButtonShiny("SwiftUI Template", .large, showLeftIcon: true, showRightIcon: false) {
                Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .padding(2)
            } action: {}
        }
        .frame(minWidth: 335, maxWidth: 500)
    }
}

struct ComponentsView: View {
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 30) {
                templateCard
                menu
                financeCard
            }
        }
    }
    
    var templateCard: some View {
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
                    .shadow(color: .black.opacity(0.1), radius: .point(60), y: .point(30))
                    .shadow(color: .black.opacity(0.5), radius: .point(60), y: .point(30))
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
    
    var menu: some View {
        VStack(spacing: 30) {
            LayersMenu {
                ButtonTooltip("Wallpaper") {
                    Image(systemName: "photo")
                } rightIcon: {
                    Image(systemName: "eye")
                } action: {}
                DividerLine()
                ButtonTooltip("Blurs") {
                    Image(systemName: "drop.halffull")
                } rightIcon: {
                    Image(systemName: "eye")
                } action: {}
                DividerLine()
                ButtonTooltip("Overlay") {
                    Image(systemName: "wand.and.stars.inverse")
                } rightIcon: {
                    Image(systemName: "eye")
                } action: {}
                DividerLine()
                ButtonTooltip("UI Components", state: .selected) {
                    Image(systemName: "iphone")
                        .symbolRenderingMode(.monochrome)
                } rightIcon: {
                    Image(systemName: "eye")
                } action: {}
                SegmentedControl {
                    ButtonToggle("Glass", .small, state: .selected, showRightIcon: false)
                    ButtonToggle("Outline", .small, showRightIcon: false)
                    ButtonToggle("Flat", .small, showRightIcon: false)
                }
                .padding(10)
                .width(.full)
                HStack(spacing: 10) {
                    GridItem {
                        Image(systemName: "moon")
                            .resizable()
                            .fontWeight(.medium)
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .padding(12)
                    }
                    GridItem {
                        Image(systemName: "sun.max")
                            .resizable()
                            .fontWeight(.medium)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                    }
                    GridItem {
                        Image(systemName: "wand.and.stars.inverse")
                            .resizable()
                            .fontWeight(.medium)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                    }
                    GridItem {
                        Image(systemName: "eye")
                            .resizable()
                            .fontWeight(.medium)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                    }
                }
                .padding(10)
                .width(.full)
                SegmentedControl {
                    ButtonToggle("sm", .small, state: .selected, showRightIcon: false)
                    ButtonToggle("md", .small, showRightIcon: false)
                    ButtonToggle("lg", .small, showRightIcon: false)
                }
                .padding(10)
                .width(.full)
            }
            Switch3D(text1: "Monthly", text2: "Yearly")
        }
    }
    
    var financeCard: some View {
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
                    .shadow(color: .black.opacity(0.1), radius: .point(60), y: .point(30))
                    .shadow(color: .black.opacity(0.5), radius: .point(60), y: .point(30))
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

#Preview {
    SwiftUIComponentsView()
}
