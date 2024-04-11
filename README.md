# Getting started

What makes SwiftUI Components unqiue is its theming. The aesthetic is unmistakably different and personal. The background sets the mood, the glass absorb the colors and the shadows elevate. Despite that, it's super flexible.

## Buttons
### Menu
#### Button Toggle
<img width="453" alt="Screenshot 2024-04-11 at 4 00 23 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/c228656b-2c84-4d00-9405-7f3adc0d23c7">
<img width="431" alt="Screenshot 2024-04-11 at 4 02 10 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/75321625-24d2-4c79-9d99-d520a7798227">

```swift
VStack(spacing: 20) {
    ButtonToggle("Menu", .small)
    ButtonToggle("Menu", .small, state: .selected)
}
VStack(spacing: 20) {
    ButtonToggle("Menu", .medium)
    ButtonToggle("Menu", .medium, state: .selected)
}
VStack(spacing: 20) {
    ButtonToggle("Menu", .large)
    ButtonToggle("Menu", .large, state: .selected)
}
VStack(spacing: 20) {
    ButtonToggle("Menu", .extraLarge)
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
