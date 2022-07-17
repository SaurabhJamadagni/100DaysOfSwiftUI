# [Day 20](https://www.hackingwithswift.com/100/swiftui/20)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
17th July, 2022

### Stacks to arrange views

- We can either have a horizontal stack (`HStack`), a vertical stack (`VStack`) or a z-stack (`ZStack`) used for depth.
- We can pass `spacing` as a parameter to provide space between the elements of a stack.
- VStack by default aligns to the centre.
- we can pass a `alignment` parameter too to define the alignment of the elements inside the stack.
- Z-stack doesn't have spacing, but you can align stuff in it.
- We can place as many stacks inside a stack as you want.

### Dealing with color

- We could use a background modifier for the text views. But that only colors the area behind the text and not the entire screen. It is similar to highlighting.
- What we can actually do is use a ZStack and add `Color` behind the element.
- We can also provide it frame so that the color only takes up that much space.
- We can also provide a min and max for the widths and heights of the frame.

```swift
ZStack {
    Color.mint
        .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
    Text("Hello, world")
}
```

- Using `Color.primary` gives you the color that is used for the text. It can change depending on the config of the device. For example, by light or dark mode.
- Color **will not** break outside the safe area.
- Don't put anything important outside the safe area.
- We are also provided with materials.
  - One of which is `.ultraThinMaterial` which gives it a frosted glass like effect.

```swift
ZStack {
    VStack(spacing: 0) {
        Color.red
        Color.mint
    }
    Text("Hello, world")
        .foregroundStyle(.secondary)
        .padding(50)
        .background(.ultraThinMaterial)
}
.ignoresSafeArea()
```

### Gradients

- We are given 3 gradients, which are views in their own rights. This means they can be directly placed into our UI.
- A linear gradient will be in a straight line. You can select where it starts, where it ends.

```swift
LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
```

- You can also vary the ratio.
  - For example, if you wish to have white for 2/3rd the screen and then make it go into a gradient we can do that.
  - This is done using stops instead of colors. We can replace `Gradient.Stop` with `.init`.

```swift
LinearGradient(gradient: Gradient(stops: [
    Gradient.Stop(color: .white, location: 0.45),
    Gradient.Stop(color: .black, location: 0.55)
]), startPoint: .top, endPoint: .bottom)
```

- Similarly we can do Radial and Anglular gradients.

### Buttons and Images

- We can have a title for the button with a trailing closure that executes the action of the button.
- We can also assigns `role`. For example a delete button will have a `.destructive` role.
- We can also pick from different `buttonStyles`.
- We can also create custom labels by using following up the button with a label.

- For images, we can use system images using `Image(systemName: "SF symbol name")`
- Using this, we can have a image inside the label of a button.
- If you use a image as a button and it is recoloured to blue by Swift, we can get the original back by using `renderingMode(.original)`.

### Alerts

- Alerts are also a function of their stats.
- Thus instead of saying that show this alert, we create the alert and set conditions when the alert should be shown.
- A `.alert` will create an alert, which has a title and the State variable bound to it.
- To the alert, we can pass in a `message` trailing closure to display the message of the alert.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
