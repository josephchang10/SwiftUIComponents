# Getting started

What makes SwiftUI Components unqiue is its theming. The aesthetic is unmistakably different and personal. The background sets the mood, the glass absorb the colors and the shadows elevate. Despite that, it's super flexible.

## Buttons
### Menu Buttons
* [Button Menu](#Button-Menu)
* [Activity](#Activity)
* [Button Toggle](#Button-Toggle)
### Symbols
#### Icons
* [Button Circle](#Button-Circle)
* [Avatar Letter](#Avatar-Letter)
* [Icon Circle](#Icon-Circle)
* [Large Badge Button](#Large-Badge-Button)
### Main
* [Button Primary](#Button-Primary)
* [Button Secondary](#Button-Secondary)
* [Button Ghost](#Button-Ghost)
* [Button Glow](#Button-Glow)
* [Button Shiny](#Button-Shiny)
* [Button Gradient](#Button-Gradient)
## Menus
### Stepper | Slider | Controls
* [Slider](#Slider)
* [Stepper](#Stepper)
### Menu
#### Filter
* [Filters Card](#Filters-Card)
### Inputs
* [Input](#Input)
* [Switch](#Switch)
### Navigation
* [Menu](#Menu-2)
* [Inspector Menu](#Inspector-Menu)
### Segmented Controls
* [Segmented Control](#Segmented-Control)
* [Toggle](#Toggle)
## Cards
### Social
* [Reply Card](#Reply-Card)
### Image
* [Image Card](#Image-Card)
### Insepctors
* [Notification](#Notification)
* [Insepctor Detail](#Insepctor-Detail)
### Media / Image / Gallery
* [Finance Card](#Finance-Card)
### Content
* [Bank Card](#Bank-Card)
* [Testimonial](#Testimonial)
### Modal
* [Payment Modal](#Payment-Modal)
* [Newsletter](#Newsletter)
## Icons
* [Logos](#Logos)
## Backgrounds
* [Background Web 4](#Background-Web-4)
## Patterns
### Patterns
* [Pattern 1](#Pattern-1)
### Blurs
* [Blur 5](#Blur-5)

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

## Shadows and Blur Styles
Shadows and blur styles are two fundamental design elements that play a crucial role in enchancing the aesthetic appeal and functionality of user interfaces (UI). Their effective application can transform a flat, two-dimensional design into a more dynamic and engaging interface. Both elements serve to create depth, draw attention, and improve the user experience by making interfaces more intuitive and visually appealing.

### How to add Blurs and Shadows

**Understanding Shadows in SwiftUI Components**

* **Design Style:**
    * Choose from three shadow styles: normal, subtle, and strong
    * Select based on the visual impact you desire; subtle for minimal depth, strong for pronounced elevation.
 
* **Element Elevation:**
    * Consider the layering of elements; modals are higher than buttons, cards stack atop content.
    * Match shadow strength to elevation level; higher elements typically warrant stronger shadows.
 
* **Simplified System:**
    * Each shadow style is crafted from three smaller shadows for a sophisticated effect.
    * Our presets eliminate the need to adjust shadow parameters manually, streamlining the design workflow.
    * Shadows are consistent between Light and Dark Mode, although in Dark Mode, glow can be used more prominently.
 
Utilize this system to enhance your design efficiently, without the hassle of extensivve customization.

## Shadows / Inner Glow in Dark Mode
In dark mode, traditional shadows (darker than the element they're cast from) can be less noticeable or even invisible, as they blend into the dark background. This makes it challenging to use shadows to create depth and separation between elements.

**Purpose of Inner Glow**:
Inner glows can be particularly effective in dark mode for creating a sense of depth. They are used to subtly highlight an element's edges, making it stand out from its background.

**Application**:
Inner glows are usually applied to the inner edges of UI elements, such as buttons or input fields. They are generally softer and more diffused compared to shadows. The color of the glow is often a lighter or contrasting shade relative to the element's color, providing a gentle lift from the dark background.

**Enchancing Focus and Interactivity**:
Inner glows are not just for aesthetic purposes; they can also enhance user interaction. For example, adding a slight inner glow to a button upon hover can indicate interactivity, guiding users on where to click.

**Balance and Contrast**:
Maintaining the right balance of light and dark elements is crucial. The shadows and glows should create enough contrast for elements to be distinguishable, but not so much that it discrupts the overall visual harmony.

**Consistency**:
Apply shadows and inner glows consistently  accross similar elements to maintain a cohesive look and feel throughout the interface.

**Accessibility**:
Ensure that the addition of these effects does not compromise the readability or usabilitiy of the interface. Text and important elements should remain legible and accessible to all users.

In summary, when designing for dark mode, the creative use of lighter shadows and inner glows can effectively create depth and emphasize key elements, enhancing the user experience while maintaining the sleek and muted aesthetic that users often associate with dark-themed interfaces.


## Typography & Content
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
#### Company Logo
<img width="277" alt="Screenshot 2024-05-12 at 6 42 06 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/d8006df3-2d97-4291-8ea2-2b56257099d1">

```swift
CompanyLogo(.visa)
CompanyLogo(.mastercard)
```

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
### Menu Buttons
#### Button Menu
<img width="720" alt="Screenshot 2024-06-16 at 12 57 14 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/ce0b1f28-c0ed-4cfb-b65b-50187b77007e">

```swift
ButtonMenu(.small, text: "Account") {
    Image(systemName: "person")
}
ButtonMenu(.medium, text: "Account") {
    Image(systemName: "person")
}
ButtonMenu(.large, text: "Account") {
    Image(systemName: "person")
}
ButtonMenu(.extraLarge, text: "Account") {
    Image(systemName: "person")
}
ButtonMenu(.small, text: "Account", state: .selected) {
    Image(systemName: "person")
}
ButtonMenu(.medium, text: "Account", state: .selected) {
    Image(systemName: "person")
}
ButtonMenu(.large, text: "Account", state: .selected) {
    Image(systemName: "person")
}
ButtonMenu(.extraLarge, text: "Account", state: .selected) {
    Image(systemName: "person")
}
```

#### Activity
<img width="488" alt="Screenshot 2024-05-13 at 8 10 09 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/54b8c0fc-708e-458b-89a4-ba321d52ee76">

![Hover](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/fe36713d-d59f-4f84-9aba-4eee6ec28f50)

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

### Symbols
#### Icons
#### Button Circle
![Button Circle](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/b9be8074-e57f-4e47-bc29-d4568ef89acb)
![Hover](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/df939822-cec9-4957-9c06-fea9cf76cf24)

```swift  
ButtonCircle(.small) {
    Image(systemName: "moon")
        .resizable()
        .padding(2.665)
}
ButtonCircle(.medium) {
    Image(systemName: "moon")
        .resizable()
        .padding(2.665)
}
ButtonCircle(.large) {
    Image(systemName: "moon")
        .resizable()
        .padding(2.665)
}
ButtonCircle(.extraLarge) {
    Image(systemName: "moon")
        .resizable()
        .padding(4)
}
ButtonCircle(.small, state: .selected) {
    Image(systemName: "moon")
        .resizable()
        .padding(2.665)
}
ButtonCircle(.medium, state: .selected) {
    Image(systemName: "moon")
        .resizable()
        .padding(2.665)
}
ButtonCircle(.large, state: .selected) {
    Image(systemName: "moon")
        .resizable()
        .padding(2.665)
}
ButtonCircle(.extraLarge, state: .selected) {
    Image(systemName: "moon")
        .resizable()
        .padding(4)
}
```

#### Avatar Letter
<img width="98" alt="Screenshot 2024-05-20 at 10 44 34 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/946d1db2-0321-4e23-bc6a-52869d73ce84">

```swift
AvatarLetter {
    Text("M")
        .font(.captionMedium)
        .frame(width: 24, height: 24)
}
```

#### Icon Circle
<img width="98" alt="Screenshot 2024-06-15 at 8 32 26 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/6f11fe33-d729-428f-ba04-f830eeba4987">

```swift
IconCircle {
    Image(systemName: "envelope")
        .resizable()
        .scaledToFit()
        .fontWeight(.bold)
        .frame(width: 16, height: 16)
}
```

#### Large Badge Button
<img width="139" alt="Screenshot 2024-06-16 at 12 09 40 AM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/eb394c6c-c0c2-4742-9dfb-dfc040f2bec4">

```swift
LargeBadgeButton {
    Image(systemName: "plus")
        .fontWeight(.bold)
}
```

### Main
#### Button Primary
<img width="499" alt="Screenshot 2024-04-16 at 7 40 45 AM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/f3db6fd0-0e3c-4c7e-a475-ed6dcb604e47">

```swift
ButtonPrimary(.small, title: "Primary") { Image(systemName: "chevron.right") }
ButtonPrimary(.medium, title: "Primary") { Image(systemName: "chevron.right") }
ButtonPrimary(.large, title: "Primary") { Image(systemName: "chevron.right") }
ButtonPrimary(.extraLarge, title: "Primary") { Image(systemName: "chevron.right") }
```

#### Button Secondary
<img width="625" alt="Screenshot 2024-06-15 at 9 55 53 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/2e3c2831-aaf0-4958-b780-cbfd84fb188c">

```swift
ButtonSecondary(.small, title: "Secondary") {
    Image(systemName: "envelope.open")
}
ButtonSecondary(.medium, title: "Secondary") {
    Image(systemName: "envelope.open")
}
ButtonSecondary(.large, title: "Secondary") {
    Image(systemName: "envelope.open")
}
ButtonSecondary(.extraLarge, title: "Secondary") {
    Image(systemName: "envelope.open")
}
```

#### Button Ghost
<img width="463" alt="Screenshot 2024-06-07 at 1 54 45 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/d3de3e83-be3f-4837-ae48-6791b5aff200">

```swift
ButtonGhost(.small, text: "Ghost") {
    Image(systemName: "play")
        .fontWeight(.bold)
}
ButtonGhost(.medium, text: "Ghost") {
    Image(systemName: "play")
        .fontWeight(.bold)
}
ButtonGhost(.large, text: "Ghost") {
    Image(systemName: "play")
        .fontWeight(.bold)
}
ButtonGhost(.extraLarge, text: "Ghost") {
    Image(systemName: "play")
        .fontWeight(.bold)
}
```

#### Button Glow
<img width="449" alt="Screenshot 2024-06-08 at 11 36 20 AM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/a761b91a-7e45-4852-9d65-a109664a769d">

```swift
ButtonGlow(.small, text: "Glow") {
    Image(systemName: "chevron.right")
}
ButtonGlow(.medium, text: "Glow") {
    Image(systemName: "chevron.right")
}
ButtonGlow(.large, text: "Glow") {
    Image(systemName: "chevron.right")
}
ButtonGlow(.extraLarge, text: "Glow") {
    Image(systemName: "chevron.right")
}
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

#### Button Gradient
<img width="579" alt="Screenshot 2024-06-07 at 2 14 56 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/d01c77a8-1696-4135-9ff4-4c2dac2270e1">

```swift
ButtonGradient("Get Started", .small) {
    Image(systemName: "chevron.right")
}
ButtonGradient("Get Started", .medium) {
    Image(systemName: "chevron.right")
}
ButtonGradient("Get Started", .large) {
    Image(systemName: "chevron.right")
}
ButtonGradient("Get Started", .extraLarge) {
    Image(systemName: "chevron.right")
}
```

## Menus
### Stepper | Slider | Controls
#### Stepper
<img width="186" alt="Screenshot 2024-06-10 at 1 33 43 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/d5447319-447b-4237-90d3-3f0f89cdb0c7">

```swift
struct StepperPreview: View {
    @State private var value = 1
    
    var body: some View {
        StepperView(value: $value)
    }
}
```

#### Slider
<img width="390" alt="Screenshot 2024-06-09 at 12 15 31 AM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/a9ff7391-5156-443b-8ed8-db92c0330582">

```swift
struct SliderPreview: View {
    @State private var value = 3000.0
    
    var body: some View {
        SliderView(value: $value, in: 0...6000, label: "CA$ \(Int(value))") {
            HStack {
                Text("Up to CA$6000")
                Spacer()
                Button("Clear") {
                    value = 3000
                }
                .buttonStyle(.plain)
            }
            .font(.captionMedium)
            .foregroundStyle(.foreground(.primary))
        }
        .frame(width: 320)
    }
}
```

### Menu
#### Filter
##### Filters Card
![Filters Card](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/e5173a83-850f-4d03-8319-bcad6c269844)

```swift 
FiltersCard {
    HStack(alignment: .firstTextBaseline, spacing: 0) {
        Text("Filters")
            .font(.headlineMedium)
            .width(.full, alignment: .leading)
        Text("Reset")
            .font(.bodyMedium)
    }
    .foregroundStyle(.foreground(.primary))
    .padding(.horizontal, 12)
    .padding(.vertical, 24)
    Separator()
    HStack(spacing: 12) {
        Text("Sort by")
            .width(.full, alignment: .leading)
        Image(systemName: "chevron.down")
    }
    .font(.bodyLargeMedium)
    .foregroundStyle(.foreground(.primary))
    .padding(12)
    Separator()
    VStack(spacing: 10) {
        Text("Stops")
            .font(.bodyLargeMedium)
            .foregroundStyle(.foreground(.primary))
            .width(.full, alignment: .leading)
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                ZStack {
                    Circle()
                        .fill(Color(red: 76 / 255, green: 137 / 255, blue: 1))
                        .frame(width: 10)
                    Circle()
                        .inset(by: 0.5)
                        .stroke(.foreground(.secondary), lineWidth: 1)
                }
                .frame(width: 16, height: 16)
                .padding(4)
                Text("Any number of stops")
                    .font(.bodyRegular)
                    .foregroundStyle(.foreground(.secondary))
                    .width(.full, alignment: .leading)
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
            HStack(spacing: 10) {
                Circle()
                    .inset(by: 0.5)
                    .stroke(.foreground(.secondary), lineWidth: 1)
                    .frame(width: 16, height: 16)
                    .padding(4)
                Text("Nonstop only")
                    .font(.bodyRegular)
                    .foregroundStyle(.foreground(.secondary))
                    .width(.full, alignment: .leading)
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
            HStack(spacing: 10) {
                Circle()
                    .inset(by: 0.5)
                    .stroke(.foreground(.secondary), lineWidth: 1)
                    .frame(width: 16, height: 16)
                    .padding(4)
                Text("1 stop or fewer")
                    .font(.bodyRegular)
                    .foregroundStyle(.foreground(.secondary))
                    .width(.full, alignment: .leading)
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
            HStack(spacing: 10) {
                Circle()
                    .inset(by: 0.5)
                    .stroke(.foreground(.secondary), lineWidth: 1)
                    .frame(width: 16, height: 16)
                    .padding(4)
                Text("2 stops or fewer")
                    .font(.bodyRegular)
                    .foregroundStyle(.foreground(.secondary))
                    .width(.full, alignment: .leading)
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
        }
    }
    .padding(.horizontal, 12)
    .padding(.vertical, 10)
    Separator()
    VStack(spacing: 12) {
        Text("Price")
            .font(.bodyLargeMedium)
            .foregroundStyle(.foreground(.primary))
            .width(.full, alignment: .leading)
        SliderView(value: $price, in: 0...6000, label: "CA$ \(Int(price))") {
            HStack {
                Text("Up to CA$6000")
                Spacer()
                Button("Clear") {
                    price = 4000
                }
                .buttonStyle(.plain)
            }
            .font(.captionMedium)
            .foregroundStyle(.foreground(.primary))
        }
    }
    .padding(12)
    Separator()
    VStack(spacing: 12) {
        Text("Travel and baggage")
            .font(.bodyLargeMedium)
            .foregroundStyle(.foreground(.primary))
            .width(.full, alignment: .leading)
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                Circle()
                    .inset(by: 0.5)
                    .stroke(.foreground(.secondary), lineWidth: 1)
                    .frame(width: 16, height: 16)
                    .padding(4)
                Text("Seat choice")
                    .font(.bodyRegular)
                    .foregroundStyle(.foreground(.secondary))
                    .width(.full, alignment: .leading)
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
            HStack(spacing: 10) {
                Circle()
                    .inset(by: 0.5)
                    .stroke(.foreground(.secondary), lineWidth: 1)
                    .frame(width: 16, height: 16)
                    .padding(4)
                Text("No cancel fee")
                    .font(.bodyRegular)
                    .foregroundStyle(.foreground(.secondary))
                    .width(.full, alignment: .leading)
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
            HStack(spacing: 10) {
                Circle()
                    .inset(by: 0.5)
                    .stroke(.foreground(.secondary), lineWidth: 1)
                    .frame(width: 16, height: 16)
                    .padding(4)
                Text("No change fee")
                    .font(.bodyRegular)
                    .foregroundStyle(.foreground(.secondary))
                    .width(.full, alignment: .leading)
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
            HStack(spacing: 10) {
                Circle()
                    .inset(by: 0.5)
                    .stroke(.foreground(.secondary), lineWidth: 1)
                    .frame(width: 16, height: 16)
                    .padding(4)
                Text("Carry-on bag")
                    .font(.bodyRegular)
                    .foregroundStyle(.foreground(.secondary))
                    .width(.full, alignment: .leading)
                StepperView(value: $carryOnBag)
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
        }
    }
    .padding(12)
    Separator()
    VStack(spacing: 12) {
        Text("Airlines")
            .font(.bodyLargeMedium)
            .foregroundStyle(.foreground(.primary))
            .width(.full, alignment: .leading)
        HStack(spacing: 12) {
            Text("Select all airlines")
                .font(.bodyRegular)
                .foregroundStyle(.foreground(.secondary))
                .width(.full, alignment: .leading)
            Switch(isOn: $selectAllAirlines)
        }
    }
    .padding(12)
}
```

### Inputs
#### Input
<img width="229" alt="Screenshot 2024-05-23 at 12 10 22 AM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/42fe138d-a0bc-46e1-a696-57668f1d9760">

```swift
struct InputView: View {
    @State private var text = ""
    
    var body: some View {
        Input("Email address", text: $text) {
            IconCircle {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .fontWeight(.bold)
                    .frame(width: 16, height: 16)
            }
        }
        .frame(width: 200)
    }
}
```

#### Switch
![Switch](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/831c2abc-65c2-4b74-bfd1-69b2dbeca336)
![Switch](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/79d17274-65a2-4805-b4a7-f0478d168d81)

```swift
struct SwitchView: View {
    @State private var isOn = false
    
    var body: some View {
        Switch(isOn: $isOn)
    }
}
```

### Navigation
#### Menu
<img width="178" alt="Screenshot 2024-04-11 at 3 08 22 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/ccc4d9cd-bd5c-4789-adc8-f3eb84bb4780">

```swift
SegmentedMenu {
    ButtonToggle("Menu", .small, showRightIcon: false)
    ButtonToggle("Menu", .small, state: .selected)
}
```

#### Inspector Menu
<img width="548" alt="Screenshot 2024-06-08 at 12 52 12 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/5096a49b-b6f0-48c3-a59e-4994a35d0166">

```swift
InspectorMenu {
    ButtonTooltip("Pixel Density") {
        Image(systemName: "arrow.up.backward.and.arrow.down.forward")
    } rightIcon: {
        Image(systemName: "chevron.down")
    } action: {}
    ZStack {
        SegmentedControl {
            ButtonToggle("1x", .small, state: .selected, showRightIcon: false)
            ButtonToggle("2x", .small, showRightIcon: false)
            ButtonToggle("3x", .small, showRightIcon: false)
            ButtonToggle("4x", .small, showRightIcon: false)
        }
    }
    .padding(10)
    DividerLine()
    ButtonTooltip("Format") {
        Image(systemName: "doc.text")
    } rightIcon: {
        Image(systemName: "chevron.down")
    } action: {}
    ZStack {
        SegmentedControl {
            ButtonToggle("PNG", .small, state: .selected, showRightIcon: false)
            ButtonToggle("JPG", .small, showRightIcon: false)
            ButtonToggle("WebP", .small, showRightIcon: false)
        }
    }
    .padding(10)
    DividerLine()
    ZStack {
        ButtonGlow(.small, text: "Download", showGlow: false) {
            Image(systemName: "square.and.arrow.down")
        }
    }
    .padding(10)
}
```

### Segmented Controls
#### Segmented Control
<img width="692" alt="Screenshot 2024-06-08 at 2 39 25 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/39b0df9b-3eca-4291-b09d-16e02fb2e602">

```swift
SegmentedControl {
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
}
SegmentedControl {
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", showRightIcon: false)
    ButtonToggle(.small, text: "Label", state: .selected, showRightIcon: false)
}
```

#### Toggle
<img width="559" alt="Screenshot 2024-06-10 at 11 51 14 AM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/29707456-fb7b-4846-87d5-8106a2069800">

```swift
HStack(spacing: 20) {
    ToggleView {
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
    }
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
    }
    ToggleView {
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small) {
            Image(systemName: "sun.max")
        }
    }
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small) {
            Image(systemName: "sun.max")
        }
    }
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "sun.max")
        }
    }
}
HStack(spacing: 20) {
    ToggleView {
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small) {
            Image(systemName: "sun.max")
        }
        ButtonCircle(.small) {
            Image(systemName: "wand.and.rays.inverse")
        }
    }
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small) {
            Image(systemName: "sun.max")
        }
        ButtonCircle(.small) {
            Image(systemName: "wand.and.rays.inverse")
        }
    }
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "sun.max")
        }
        ButtonCircle(.small) {
            Image(systemName: "wand.and.rays.inverse")
        }
    }
}
HStack(spacing: 20) {
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small) {
            Image(systemName: "sun.max")
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "wand.and.rays.inverse")
        }
    }
    ToggleView {
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small) {
            Image(systemName: "sun.max")
        }
        ButtonCircle(.small) {
            Image(systemName: "wand.and.rays.inverse")
        }
        ButtonCircle(.small) {
            Image(systemName: "person")
        }
    }
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small) {
            Image(systemName: "sun.max")
        }
        ButtonCircle(.small) {
            Image(systemName: "wand.and.rays.inverse")
        }
        ButtonCircle(.small) {
            Image(systemName: "person")
        }
    }
}
HStack(spacing: 20) {
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "sun.max")
        }
        ButtonCircle(.small) {
            Image(systemName: "wand.and.rays.inverse")
        }
        ButtonCircle(.small) {
            Image(systemName: "person")
        }
    }
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small) {
            Image(systemName: "sun.max")
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "wand.and.rays.inverse")
        }
        ButtonCircle(.small) {
            Image(systemName: "person")
        }
    }
    ToggleView {
        ButtonCircle(.small) {
            Image(systemName: "moon")
        }
        ButtonCircle(.small) {
            Image(systemName: "display")
                .symbolRenderingMode(.monochrome)
        }
        ButtonCircle(.small) {
            Image(systemName: "sun.max")
        }
        ButtonCircle(.small) {
            Image(systemName: "wand.and.rays.inverse")
        }
        ButtonCircle(.small, state: .selected) {
            Image(systemName: "person")
        }
    }
}
```

## Cards
### Social
#### Reply Card
<img width="687" alt="Screenshot 2024-06-03 at 5 46 03 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/a9f5b32b-ac23-46d2-99e1-1ecbe51a25d3">

```swift
ReplyCard(text: .constant("Yes, if you’re new to SwiftUI, I recommend taking the iOS course first since it covers more the basics and is more complete with 60 videos."), buttonTitle: "Reply to comment") {
    HStack(spacing: 12) {
        AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2680&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
        VStack(alignment: .leading) {
            Text("Alexander Hipp, Designer")
                .font(.footnoteMedium)
                .foregroundStyle(.foreground(.primary))
            Text("Designer at a tech startup")
                .font(.smallMedium)
                .foregroundStyle(.foreground(.secondary))
        }
    }
}
```

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

### Inspectors
#### Notification
![Notification](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/2f16f7a2-d372-4e74-9616-ffc364a6bf6d)
![Hover](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/fafa0783-9b08-48ae-aeb9-1942c09d249c)

```swift
Notification(title: "Notifications") {
    ButtonCircle(.small) {
        Image(systemName: "house")
    }
    ButtonCircle(.small) {
        Image(systemName: "slider.horizontal.3")
    }
    AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1580489944761-15a19d654956?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww")) { image in
        image
            .resizable()
            .scaledToFill()
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    } placeholder: {
        Color.clear
            .frame(width: 24, height: 24)
    }
} content: {
    Activity(title: "Alex Suprun", text: "prepared a report", time: .now.addingTimeInterval(-60 * 2)) {
        AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
    }
    Activity(title: "Stephanie Liverani", text: "invited you to a chat", time: .now.addingTimeInterval(-60 * 5)) {
        AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
    }
    Activity(title: "Nicolas Horn", text: "invited you to a meeting", time: .now.addingTimeInterval(-60 * 15)) {
        AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
    }
    Activity(.selected, title: "Alexander Hipp", text: "invited you to a meeting", time: .now.addingTimeInterval(-60 * 60 * 24)) {
        AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
    }
    DividerLine()
    HStack {
        Text("2 unread")
            .font(.captionRegular)
            .foregroundStyle(.foreground(.secondary))
        Spacer()
        ButtonPrimary("Mark all as read", .small)
    }
}
```

#### Insepctor Detail
![](https://github.com/josephchang10/SwiftUIComponents/assets/5158525/f5239296-48b7-4106-85b6-d82fc50c47b1)

```swift
InspectorDetail {
    VStack(spacing: 16) {
        HStack {
            Text("Balance")
                .foregroundStyle(.foreground(.secondary))
            Spacer()
            Image(systemName: "plus")
        }
        .font(.bodyMedium)
        .width(.full)
        BankCard(.card2, number: "****   ****   ****   2859", validThru: "Valid thru 06/24", notchLabel: "CREDIT CARD") {
            CompanyLogo(.mastercard)
        }
        .shadowBlurStrong(.extraLarge)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
        VStack(alignment: .leading, spacing: 9) {
            Text("Card details")
                .font(.bodyMedium)
            HStack {
                Text("Card number")
                    .font(.captionMedium)
                Spacer()
                Text("****")
                    .font(.captionRegular)
            }
            HStack {
                Text("Balance")
                    .font(.captionMedium)
                Spacer()
                Text("$28,678.65")
                    .font(.captionRegular)
            }
            HStack {
                Text("Currency")
                    .font(.captionMedium)
                Spacer()
                Text("USD")
                    .font(.captionRegular)
            }
            HStack {
                Text("Status card")
                    .font(.captionMedium)
                Spacer()
                Text("06/24 (Active)")
                    .font(.captionRegular)
            }
        }
        .foregroundStyle(.foreground(.secondary))
        HStack {
            ButtonIcon(.medium) {
                Image(systemName: "chevron.left")
            }
            Spacer()
            Text("1 of 4")
                .font(.captionRegular)
                .foregroundStyle(.foreground(.secondary))
            Spacer()
            ButtonIcon(.medium) {
                Image(systemName: "chevron.right")
            }
        }
    }
    DividerLine()
    VStack(spacing: 8) {
        HStack(alignment: .top) {
            Text("Notifications")
                .font(.bodyMedium)
            Spacer()
            Text("See all")
                .font(.footnoteRegular)
        }
        .foregroundStyle(.foreground(.secondary))
        .padding(.vertical, 8)
        Activity(title: "Alex Suprun", text: "prepared a report", time: .now.addingTimeInterval(-60 * 2)) {
            AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        }
        Activity(title: "Stephanie Liverani", text: "invited you to a chat", time: .now.addingTimeInterval(-60 * 5)) {
            AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        }
        Activity(title: "Nicolas Horn", text: "invited you to a meeting", time: .now.addingTimeInterval(-60 * 15)) {
            AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        }
        Activity(.selected, title: "Alexander Hipp", text: "invited you to a meeting", time: .now.addingTimeInterval(-60 * 60 * 24)) {
            AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        }
    }
    HStack {
        Text("2 unread")
            .font(.captionRegular)
            .foregroundStyle(.foreground(.secondary))
        Spacer()
        ButtonPrimary("Mark all as read", .small)
    }
}
```

### Media / Image / Gallery
#### Finance Card
<img width="832" alt="Screenshot 2024-06-16 at 11 30 05 AM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/2beeb897-ce78-42c3-8024-cd27bca8a9d8">

```swift
FinanceCard {
    BankCard(.card1, number: "****   ****   ****   2859", validThru: "Valid thru 06/24", notchLabel: "DEBIT CARD") {
        CompanyLogo(.visa)
            .frame(width: 80, height: 24)
    }
    VStack(alignment: .leading, spacing: 10) {
        HStack(spacing: 10) {
            Image(systemName: "creditcard")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundStyle(.foreground(.primary))
            Text("All your cards in one place")
                .font(.footnoteRegular)
                .foregroundStyle(.foreground(.secondary))
        }
        Text("Smart cards")
            .font(.heading5)
            .foregroundStyle(.foreground(.primary))
        Text("Make your finances work for you with the power of AI. From tracking expenses to planning investments, gain insights.")
            .font(.footnoteRegular)
            .foregroundStyle(.foreground(.secondary))
            .fixedSize(horizontal: false, vertical: true)
        DividerLine()
        HStack {
            ButtonGlow(.small, text: "Add card") {
                Image(systemName: "plus.circle")
            }
            Spacer()
            HStack(spacing: 0) {
                ButtonIcon(.medium) {
                    Image(systemName: "arrow.left")
                }
                Separator()
                ButtonIcon(.medium) {
                    Image(systemName: "arrow.right")
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .inset(by: 0.5)
                    .stroke(.container(.divider), lineWidth: 1)
            }
        }
    }
    .width(.full, alignment: .leading)
    .padding(10)
}
```

### Content
#### Bank Card
<img width="651" alt="Screenshot 2024-05-12 at 6 38 32 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/fe4ef7ec-92ab-4b30-8d9a-8c98b637c306">

```swift
BankCard(.card1, number: "****   ****   ****   2859", validThru: "Valid thru 06/24", notchLabel: "DEBIT CARD") {
    CompanyLogo(.visa)
        .frame(width: 80, height: 24)
}
BankCard(.card2, number: "****   ****   ****   2859", validThru: "Valid thru 06/24", notchLabel: "CREDIT CARD") {
    CompanyLogo(.mastercard)
        .frame(width: 80, height: 24)
}
```

#### Testimonial
<img width="650" alt="Screenshot 2024-05-21 at 9 22 56 AM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/6e7905da-29c6-454f-8596-8bf7f6b60b7c">

```swift
Testimonial {
    VStack(alignment: .leading, spacing: 20) {
        ToggleView {
            ButtonCircle(.small, state: .selected) {
                Image(systemName: "moon")
            }
            ButtonCircle(.small) {
                Image(systemName: "sun.max")
            }
        }
        VStack(alignment: .leading, spacing: 8) {
            Text("Mobbin")
                .font(.bodyMedium)
            Text("Mobile & web design references")
                .font(.footnoteMedium)
                .foregroundStyle(.foreground(.secondary))
            DividerLine()
            Text("Built with the latest Figma and Framer features, the meticulously crafted, fully customisable components will turbocharge your design workflow, ensuring seamless consistency and efficiency in all your projects.")
                .font(.footnoteRegular)
                .foregroundStyle(.foreground(.secondary))
            DividerLine()
            HStack(spacing: 8) {
                AvatarSmall {
                    Text("J")
                        .font(.captionMedium)
                        .frame(width: 24, height: 24)
                }
                Text("Jiho Lim, Creator of Mobbin")
                    .font(.footnoteMedium)
                    .foregroundStyle(.foreground(.secondary))
            }
        }
    }
} logo: {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colors: [.white.opacity(0), .white.opacity(0.52)], startPoint: .top, endPoint: .bottom).opacity(0.5))
            .padding(7)
            .rotationEffect(.degrees(45))
            .shadowBlur(.small)
        RoundedRectangle(cornerRadius: 10)
            .stroke(LinearGradient(colors: [.white.opacity(0), .white], startPoint: .bottomTrailing, endPoint: .topLeading), lineWidth: 1)
            .padding(7)
            .rotationEffect(.degrees(45))
            .blendMode(.overlay)
        RoundedRectangle(cornerRadius: 10)
            .stroke(.white.opacity(0.1), lineWidth: 1)
            .padding(7)
            .rotationEffect(.degrees(45))
            .blendMode(.overlay)
        Logo(.x)
            .frame(width: 24, height: 24)
    }
    .frame(width: 44, height: 44)
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

### Modal

#### Payment Modal
<img width="686" alt="Screenshot 2024-04-15 at 9 14 38 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/ca0cebb1-e6d2-44d4-9111-45c1615c8867">

```swift
struct PaymentModalView: View {
    @State private var email = ""
    
    var body: some View {
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
                Input(.large, prompt: "Email address", text: $email, showLeftIcon: true) {
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
        .frame(width: 310)
    }
}
```

#### Newsletter
<img width="748" alt="Screenshot 2024-06-15 at 10 18 17 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/411bad07-8859-4d60-8823-06e353bd7573">

```swift 
struct NewsletterView: View {
    @State private var email = "Email address"
    
    var body: some View {
        Newsletter {
            VStack(alignment: .leading, spacing: 8) {
                Text("Subscribe via Email")
                    .font(.heading5)
                    .width(.full, alignment: .leading)
                    .foregroundStyle(.textGradient(.secondary))
                    .shadow(color: .black.opacity(0.5), radius: 60, y: 30)
                Text("We release monthly updates to the content an make regular site improvements.")
                    .font(.footnoteMedium)
                    .foregroundStyle(.foreground(.secondary))
            }
            Input(.small, text: $email) {
                IconCircle {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.bold)
                        .frame(width: 16, height: 16)
                }
            }
            ButtonPrimary(.small, title: "Subscribe to Newsletter") {
                Image(systemName: "tray")
            }
            Text("No spam ever. We typically send 1 email per month for product updates, events and discounts.")
                .font(.captionRegular)
                .fixedSize(horizontal: false, vertical: true)
            DividerLine()
            ButtonSecondary(.small, title: "Subscribe to YouTube") {
                Logo(.youtube)
            }
            ButtonSecondary(.small, title: "Follow on") {
                Logo(.x)
            }
        }
        .frame(width: 320)
    }
}
```

## Icons
### Logos
<img width="132" alt="Screenshot 2024-06-15 at 10 14 39 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/2ab72925-4be0-4d28-bd5e-ecff66d8b10b">

```swift
Logo(.x)
    .frame(width: 24, height: 24)
Logo(.youtube)
    .frame(width: 24, height: 24)
```

## Patterns
### Patterns
#### Pattern 1
<img width="445" alt="Screenshot 2024-05-12 at 4 54 35 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/2f21cc84-27ee-4f38-8a37-8c7da70b76ea">

```swift
Pattern1()
```

### Blurs
#### Blur 5
<img width="349" alt="Screenshot 2024-06-10 at 8 11 02 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/1d203a9c-70d6-4a53-ab2d-028aa6b546ea">

```swift
Blur5()
```

## Backgrounds
### Background Web 4
<img width="623" alt="Screenshot 2024-05-22 at 10 47 27 PM" src="https://github.com/josephchang10/SwiftUIComponents/assets/5158525/83e2d931-b8c0-4c08-9d07-46ef0db135d8">

```swift
BackgroundWeb4()
```
