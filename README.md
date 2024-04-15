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
