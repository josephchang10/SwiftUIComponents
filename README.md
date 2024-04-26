# Getting started

What makes SwiftUI Components unqiue is its theming. The aesthetic is unmistakably different and personal. The background sets the mood, the glass absorb the colors and the shadows elevate. Despite that, it's super flexible.

## Colors
### Color Styles Light Mode
<img width="553" alt="Screenshot 2024-04-15 at 4 14 38 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/290cc54b-3343-4641-a622-f841ef8ce3d9">

### Color Styles Dark Mode
<img width="547" alt="Screenshot 2024-04-15 at 4 14 48 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/2f21ad2d-88bc-4361-a9ec-a7ceb6ec937d">

```swift
Circle()
    .fill(.foreground(.primary))
    .stroke(.container(.divider), lineWidth: 1)

Circle()
    .fill(.foreground(.secondary))
    .stroke(.container(.divider), lineWidth: 1)

Circle()
    .fill(.foreground(.tertiary))
    .stroke(.container(.divider), lineWidth: 1)

Circle()
    .fill(.container(.background))
    .stroke(.container(.divider), lineWidth: 1)

Circle()
    .stroke(.container(.divider), lineWidth: 1)
    .overlay {
        ContainerBorder()
            .clipShape(Circle())
    }

Circle()
    .stroke(.container(.divider), lineWidth: 1)
    .overlay {
        ContainerDivider()
            .clipShape(Circle())
    }
```

# Typography & Content
![Typography](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/749563be-1af2-445f-a645-6a3fa8a81bba)

```swift
Text(("Heading 1 - 60 Semibold")
    .font(.heading1)
Text(("Heading 2 - 50 Semibold")
    .font(.heading2)
Text(("Heading 3 - 40 Semibold")
    .font(.heading3)
Text(("Heading 4 - 30 Semibold")
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
```

<img width="376" alt="Screenshot 2024-04-15 at 4 34 35 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/09820c02-626b-4372-8ff6-91ee242835b9">

### Assets
#### Divider
<img width="245" alt="Screenshot 2024-04-15 at 4 49 33 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/eeadb283-f0ad-4b15-8084-d9579274bd32">

```swift
DividerLine()
    .environment(\.colorScheme, .light)
DividerLine()
    .environment(\.colorScheme, .dark)
```

### Lists
#### Text Check
<img width="197" alt="Screenshot 2024-04-15 at 5 25 31 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/61d807da-73c6-469b-ace0-717881793cc6">

```swift
TextCheck("All 200+ components")
    .environment(\.colorScheme, .light)
TextCheck("All 200+ components")
    .environment(\.colorScheme, .dark)
```

## Buttons
### Menu
#### Button Menu
<img width="651" alt="Screenshot 2024-04-11 at 5 58 36 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/8608d551-c5c5-4ae5-975b-5a1c0d2ff56b">

```swift
HStack(spacing: 10) {
    ButtonMenu("Account", .small) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", .medium) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", .large) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", .extraLarge) {
        Image(systemName: "person")
    }
}
.environment(\.colorScheme, .light)
HStack(spacing: 10) {
    ButtonMenu("Account", .small) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", .medium) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", .large) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", .extraLarge) {
        Image(systemName: "person")
    }
}
.environment(\.colorScheme, .dark)
HStack(spacing: 10) {
    ButtonMenu("Account", state: .selected, .small) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", state: .selected, .medium) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", state: .selected, .large) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", state: .selected, .extraLarge) {
        Image(systemName: "person")
    }
}
.environment(\.colorScheme, .light)
HStack(spacing: 10) {
    ButtonMenu("Account", state: .selected, .small) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", state: .selected, .medium) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", state: .selected, .large) {
        Image(systemName: "person")
    }
    ButtonMenu("Account", state: .selected, .extraLarge) {
        Image(systemName: "person")
    }
}
.environment(\.colorScheme, .dark)
```

### Activity
<img width="487" alt="Screenshot 2024-04-26 at 2 18 05 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/a5275733-a5df-4942-a172-b066061cf8da">

```swift
Activity(title: "Dawyne Joe", text: "prepared a report", time: .now.addingTimeInterval(-60 * 2)) {
    AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1713747637487-0fbc89f8a4c8?w=100&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNTZ8fHxlbnwwfHx8fHw%3D")) { image in
        image
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
    } placeholder: {
        ProgressView()
    }
    .frame(width: 32, height: 32)
}
.frame(width: 220)
Activity(.selected, title: "Dawyne Joe", text: "prepared a report", time: .now.addingTimeInterval(-60 * 2)) {
    AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1713747637487-0fbc89f8a4c8?w=100&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNTZ8fHxlbnwwfHx8fHw%3D")) { image in
        image
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
    } placeholder: {
        ProgressView()
    }
    .frame(width: 32, height: 32)
}
.frame(width: 220)
```

#### Button Toggle
<img width="476" alt="Screenshot 2024-04-11 at 4 06 38 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/0da95188-5888-4988-9567-77284bce49e5">
<img width="476" alt="Screenshot 2024-04-11 at 4 06 46 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/e7979df2-2cca-46bd-968c-6e418c85676e">

```swift
HStack(spacing: 20) {
    ButtonToggle("Menu", .small)
    ButtonToggle("Menu", .medium)
    ButtonToggle("Menu", .large)
    ButtonToggle("Menu", .extraLarge)
}
HStack(spacing: 20) {
    ButtonToggle("Menu", .small, state: .selected)
    ButtonToggle("Menu", .medium, state: .selected)
    ButtonToggle("Menu", .large, state: .selected)
    ButtonToggle("Menu", .extraLarge, state: .selected)
}
```

### Main
#### Button Primay
<img width="499" alt="Screenshot 2024-04-16 at 7 40 45 AM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/f3db6fd0-0e3c-4c7e-a475-ed6dcb604e47">

```swift
HStack(alignment: .top, spacing: 10) {
    ButtonPrimary("Primary", .small) { Image(systemName: "chevron.right") }
    ButtonPrimary("Primary", .medium) { Image(systemName: "chevron.right") }
    ButtonPrimary("Primary", .large) { Image(systemName: "chevron.right") }
    ButtonPrimary("Primary", .extraLarge) { Image(systemName: "chevron.right") }
}
.environment(\.colorScheme, .light)
HStack(alignment: .top) {
    ButtonPrimary("Primary", .small) { Image(systemName: "chevron.right") }
    ButtonPrimary("Primary", .medium) { Image(systemName: "chevron.right") }
    ButtonPrimary("Primary", .large) { Image(systemName: "chevron.right") }
    ButtonPrimary("Primary", .extraLarge) { Image(systemName: "chevron.right") }
}
.environment(\.colorScheme, .dark)
```

#### Button Shiny
<img width="480" alt="Screenshot 2024-04-15 at 5 42 39 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/fb1b2d31-32b0-4ee3-bb92-6851a51c5491">

```swift
HStack(spacing: 10) {
    ButtonShiny("Shiny", .small) {
        Image(systemName: "chevron.right")
    }
    ButtonShiny("Shiny", .medium) {
        Image(systemName: "chevron.right")
    }
    ButtonShiny("Shiny", .large) {
        Image(systemName: "chevron.right")
    }
    ButtonShiny("Shiny", .extraLarge) {
        Image(systemName: "chevron.right")
    }
}
.environment(\.colorScheme, .light)
HStack(spacing: 10) {
    ButtonShiny("Shiny", .small) {
        Image(systemName: "chevron.right")
    }
    ButtonShiny("Shiny", .medium) {
        Image(systemName: "chevron.right")
    }
    ButtonShiny("Shiny", .large) {
        Image(systemName: "chevron.right")
    }
    ButtonShiny("Shiny", .extraLarge) {
        Image(systemName: "chevron.right")
    }
}
.environment(\.colorScheme, .dark)
```

### Small
#### Icon Circle
<img width="99" alt="Screenshot 2024-04-15 at 8 35 48 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/04890b7f-b4e3-4720-ac35-666f0afe4bab">

```swift
IconCircle {
    Image(systemName: "envelope")
        .resizable()
        .scaledToFit()
}
.environment(\.colorScheme, .light)
IconCircle {
    Image(systemName: "envelope")
        .resizable()
        .scaledToFit()
}
.environment(\.colorScheme, .dark)
```

## Menus
### Navigation
#### Menu
<img width="178" alt="Screenshot 2024-04-11 at 3 08 22 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/ccc4d9cd-bd5c-4789-adc8-f3eb84bb4780">

```swift
SegmentedMenu {
    ButtonToggle("Menu", .small, showRightIcon: false) {}
    ButtonToggle("Menu", .small, state: .selected) {}
}
```

## Cards
### Image
#### Image Card
<img width="649" alt="Screenshot 2024-04-14 at 4 27 29 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/578f419a-c741-4a5b-a839-50d38dc364e0">

```swift
ImageCard {
    Image("Image Card", bundle: .module)
        .resizable()
        .scaledToFill()
} content: {
    VStack(spacing: 10) {
        HStack(spacing: 8) {
            Image(systemName: "doc.text")
            Text("Menus")
                .foregroundStyle(.foreground(.secondary))
        }
        .font(.bodyMedium)
        Text("Try our free sample download to test compatibility with your design.")
            .font(.footnoteRegular)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .foregroundStyle(.foreground(.secondary))
        DividerLine()
        ButtonGlow("Browse components") {
            Image(systemName: "circle.grid.3x3.fill")
        }
    }
}
```

### Pricing
#### Pricing Card
<img width="625" alt="Screenshot 2024-04-15 at 7 36 54 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/e676439c-074f-42a5-8e30-9ed1a89f3ddf">

```swift
PricingCard {
    VStack(spacing: 20) {
        VStack(spacing: 0) {
            Text("All-Access")
                .font(.footnoteMedium)
            HStack(spacing: 4) {
                Text("$")
                    .font(.heading4)
                    .foregroundStyle(.foreground(.secondary))
                Text("99")
                    .font(.heading1)
                    .foregroundStyle(.foreground(.primary))
            }
            Text("One-time")
                .font(.captionRegular)
                .foregroundStyle(.foreground(.tertiary))
        }
        DividerLine()
        VStack(alignment: .leading, spacing: 8) {
            TextCheck("All 300+ components")
            TextCheck("2,000+ SwiftUI variants")
            TextCheck("2,116 unique icons")
        }
        .frame(width: 220)
        DividerLine()
        ButtonShiny("Buy now", .medium) {
            Image(systemName: "creditcard")
        }
    }
    .padding(10)
}
```

#### Payment Modal
<img width="686" alt="Screenshot 2024-04-15 at 9 14 38 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/ca0cebb1-e6d2-44d4-9111-45c1615c8867">

```swift
PaymentModal {
    VStack(spacing: 12) {
        VStack(spacing: 0) {
            Text("Pro Plan")
                .font(.footnoteMedium)
                .foregroundStyle(.foreground(.secondary))
            HStack(spacing: 0) {
                Text("$")
                    .font(.heading4)
                Text("25")
                    .font(.heading1)
            }
            .foregroundStyle(.foreground(.primary))
            Text("per month, billed monthly")
                .font(.footnoteMedium)
                .foregroundStyle(.foreground(.secondary))
        }
        Input("Email address", text: .constant(""), showLeftIcon: true) {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
        }
        Text("You will be charged $120 for a one year access. When you click on \"Subscribe\", your subscription will begin and you will be charged $120 immediately. It will renew automatically. You are also agreeing to our Terms of Service and our Privacy Policy.")
            .font(.captionRegular)
            .foregroundStyle(.foreground(.primary))
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        ButtonShiny("Subscribe", .medium) {
            Image(systemName: "chevron.right")
        }
        DividerLine()
        Text("OR, PAY WITH PAYPAL")
            .font(.footnoteMedium)
            .foregroundStyle(.foreground(.primary))
        ButtonShiny("Pay with PayPal", .medium) {
            Image(systemName: "chevron.right")
        }
        Text("This purchase will not auto-review. You will be taken to PayPal to complete the payment.")
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .font(.captionRegular)
            .foregroundStyle(.foreground(.primary))
    }
    .padding(12)
}
```
