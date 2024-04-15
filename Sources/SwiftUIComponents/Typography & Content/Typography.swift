//
//  Typography.swift
//
//
//  Created by Jiafu Zhang on 4/5/24.
//

import SwiftUI

public enum Typography {
    case heading1
    case heading2
    case heading3
    case heading4
    case heading5
    case headlineRegular
    case headlineMedium
    case bodyLargeRegular
    case bodyLargeMedium
    case bodyRegular
    case bodyMedium
    case footnoteRegular
    case footnoteMedium
    case captionRegular
    case captionMedium
    case smallRegular
    case smallMedium
    case bodyLargeMono
    case bodyMono
    case footnoteMono
    case captionMono
    case smallMono
    
    var size: CGFloat {
        switch self {
        case .heading1:
            isMobile ? 40 : 60
        case .heading2:
            isMobile ? 30 : 50
        case .heading3:
            isMobile ? 28 : 40
        case .heading4:
            isMobile ? 24 : 30
        case .heading5:
            24
        case .headlineRegular, .headlineMedium:
            20
        case .bodyLargeRegular, .bodyLargeMedium, .bodyLargeMono:
            18
        case .bodyRegular, .bodyMedium, .bodyMono:
            16
        case .footnoteRegular, .footnoteMedium, .footnoteMono:
            14
        case .captionRegular, .captionMedium, .captionMono:
            13
        case .smallRegular, .smallMedium, .smallMono:
            12
        }
    }
    
    var weight: Font.Weight {
        switch self {
        case .heading1, .heading2, .heading3, .heading4, .heading5:
            .semibold
        case .headlineMedium, .bodyLargeMedium, .bodyMedium, .footnoteMedium, .captionMedium, .smallMedium:
            .medium
        default:
            .regular
        }
    }
    
    var fill: Color {
        .foreground(.primary)
    }
    
    var design: Font.Design {
        switch self {
        case .bodyLargeMono, .bodyMono ,.footnoteMono, .captionMono, .smallMono:
            .monospaced
        default:
            .default
        }
    }
    
    var isMobile: Bool {
        #if os(macOS)
        false
        #else
        if let width = UIScreen.current?.bounds.width, let breakpoint = Breakpoint(width: width) {
            breakpoint == .mobile
        } else {
            false
        }
        #endif
    }
}

struct TypographyViewModifier: ViewModifier {
    let typograph: Typography
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: typograph.size, weight: typograph.weight, design: typograph.design))
            .foregroundStyle(typograph.fill)
    }
}

extension View {
    func typograph(_ typograph: Typography) -> some View {
        modifier(TypographyViewModifier(typograph: typograph))
    }
}

public extension Font {
    static var heading1: Self {
        .system(size: Typography.heading1.size, weight: Typography.heading1.weight, design: Typography.heading1.design)
    }
    
    static var heading2: Self {
        .system(size: Typography.heading2.size, weight: Typography.heading2.weight, design: Typography.heading2.design)
    }
    
    static var heading3: Self {
        .system(size: Typography.heading3.size, weight: Typography.heading3.weight, design: Typography.heading3.design)
    }
    
    static var heading4: Self {
        .system(size: Typography.heading4.size, weight: Typography.heading4.weight, design: Typography.heading4.design)
    }
    
    static var heading5: Self {
        .system(size: Typography.heading5.size, weight: Typography.heading5.weight, design: Typography.heading5.design)
    }
    
    static var headlineRegular: Self {
        .system(size: Typography.headlineRegular.size, weight: Typography.headlineRegular.weight, design: Typography.headlineRegular.design)
    }
    
    static var headlineMedium: Self {
        .system(size: Typography.headlineMedium.size, weight: Typography.headlineMedium.weight, design: Typography.headlineRegular.design)
    }
    
    static var bodyLargeRegular: Self {
        .system(size: Typography.bodyLargeRegular.size, weight: Typography.bodyLargeRegular.weight, design: Typography.bodyLargeRegular.design)
    }
    
    static var bodyLargeMedium: Self {
        .system(size: Typography.bodyLargeMedium.size, weight: Typography.bodyLargeMedium.weight, design: Typography.bodyLargeMedium.design)
    }
    
    static var bodyRegular: Self {
        .system(size: Typography.bodyRegular.size, weight: Typography.bodyRegular.weight, design: Typography.bodyRegular.design)
    }
    
    static var bodyMedium: Self {
        .system(size: Typography.bodyMedium.size, weight: Typography.bodyMedium.weight, design: Typography.bodyMedium.design)
    }
    
    static var footnoteRegular: Self {
        .system(size: Typography.footnoteRegular.size, weight: Typography.footnoteRegular.weight, design: Typography.footnoteRegular.design)
    }
    
    static var footnoteMedium: Self {
        .system(size: Typography.footnoteMedium.size, weight: Typography.footnoteMedium.weight, design: Typography.footnoteMedium.design)
    }
    
    static var captionRegular: Self {
        .system(size: Typography.captionRegular.size, weight: Typography.captionRegular.weight, design: Typography.captionRegular.design)
    }
    
    static var captionMedium: Self {
        .system(size: Typography.captionMedium.size, weight: Typography.captionMedium.weight, design: Typography.captionMedium.design)
    }
    
    static var smallRegular: Self {
        .system(size: Typography.smallRegular.size, weight: Typography.smallRegular.weight, design: Typography.smallRegular.design)
    }
    
    static var smallMedium: Self {
        .system(size: Typography.smallMedium.size, weight: Typography.smallMedium.weight, design: Typography.smallMedium.design)
    }
    
    static var bodyLargeMono: Self {
        .system(size: Typography.bodyLargeMono.size, weight: Typography.bodyLargeMono.weight, design: Typography.bodyLargeMono.design)
    }
    
    static var bodyMono: Self {
        .system(size: Typography.bodyMono.size, weight: Typography.bodyMono.weight, design: Typography.bodyMono.design)
    }
    
    static var footnoteMono: Self {
        .system(size: Typography.footnoteMono.size, weight: Typography.footnoteMono.weight, design: Typography.footnoteMono.design)
    }
    
    static var captionMono: Self {
        .system(size: Typography.captionMono.size, weight: Typography.captionMono.weight, design: Typography.captionMono.design)
    }
    
    static var smallMono: Self {
        .system(size: Typography.smallMono.size, weight: Typography.smallMono.weight, design: Typography.smallMono.design)
    }
}

struct TypographyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                let heading1 = Typography.heading1
            Text((heading1.isMobile ? "Mobile " : "") + "Heading 1 - \(Int(heading1.size)) Semibold")
                .font(.heading1)
            let heading2 = Typography.heading2
            Text((heading2.isMobile ? "Mobile " : "") + "Heading 2 - \(Int(heading2.size)) Semibold")
                .font(.heading2)
            let heading3 = Typography.heading3
            Text((heading3.isMobile ? "Mobile " : "") + "Heading 3 - \(Int(heading3.size)) Semibold")
                .font(.heading3)
            let heading4 = Typography.heading4
            Text((heading4.isMobile ? "Mobile " : "") + "Heading 4 - \(Int(heading4.size)) Semibold")
                .font(.heading4)
            Text("Heading 5 - 24 Semibold")
                .font(.heading5)
            Text("Headline Regular - 20 Regular")
                .font(.headlineRegular)
            Text("Headline Medium - 20 Medium")
                .font(.headlineMedium)
            Text("Body Large Regular - 18 Regular")
                .font(.bodyLargeRegular)
            Text("Body Large Medium - 18 Medium")
                .font(.bodyLargeMedium)
            Text("Body Regular - 16 Regular")
                .font(.bodyRegular)
            Text("Body Medium - 16 Medium")
                .font(.bodyMedium)
            Text("Footnote Regular - 14 Regular")
                .font(.footnoteRegular)
            Text("Footnote Medium - 14 Medium")
                .font(.footnoteMedium)
            Text("Caption Regular - 13 Regular")
                .font(.captionRegular)
            Text("Caption Medium - 13 Medium")
                .font(.captionMedium)
            Text("Small Regular - 12 Regular")
                .font(.smallRegular)
            Text("Small Medium - 12 Medium")
                .font(.smallMedium)
            Text("Body Large Mono - 18 Mono")
                .font(.bodyLargeMono)
            Text("Body Mono - 16 Mono")
                .font(.bodyMono)
            Text("Footnote Mono - 14 Mono")
                .font(.footnoteMono)
            Text("Caption Mono - 13 Mono")
                .font(.captionMono)
            Text("Small Mono - 12 Mono")
                .font(.smallMono)
            }
            .foregroundStyle(.foreground(.primary))
            .padding(30)
            .background(.black)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    TypographyView()
}
