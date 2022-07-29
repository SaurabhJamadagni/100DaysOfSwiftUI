# [Day 32](https://www.hackingwithswift.com/100/swiftui/32)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
28th July, 2022

### Implicit animations

- We can create a basic scaling animation using the `.animation` modifier that takes a variable as a value to scale at.
- We nowhere have to say what the frame by frame animation should look like. It is for SwiftUI to figure out implicitly.

```swift
// variable outside view
@State private var animationAmount = 1.0

// Main view body
Button("Tap Me") {
    animationAmount += 1
}
.padding(50)
.background(.red)
.foregroundColor(.white)
.clipShape(Circle())
.scaleEffect(animationAmount)
.blur(radius: (animationAmount - 1) * 3)    // circle keeps getting more blur as you scale.
.animation(.default, value: animationAmount)
```

- By default, you can expect a simple ease in ease out animation. But we can choose the kind we would like.
- Some of the available options include easeOut, easeIn, interpolatingSpring
- We can also control how long an animation lasts using the `duration` parameter.
- We can also delay the animation using the `delay` modifier.

```swift
.animation(
    .easeInOut(duration: 2)
        .delay(1),
    value: animationAmount
)
```

- Creating a pulsating circle effect using the overlay modifier

### Animation bindings

- You can animate binding variables as they change from their old value to the new value.
- To do this we can use the `.animation()` method for the binding variable.

```swift
// let animationAmount is the variable

Stepper("Scale amount", value: $animationAmount.animation(), in: 1...4)
```

- If anyone has ever used Magic Move in Apple's keynote presentation software, you can imagine how the animation works.
- That is why it can even animate booleans even if there is no intermediate value to fill over.
- We can also customise this animation like we did earlier.

### Explicit animations

- This is when we have to instruct that something should occur with animation using the `withAnimation` modifier.

### Code snippets

- Pulsating overlay animation

```swift
@State private var animationAmount = 1.0

var body: some View {
    Button("Pulse") {
        // do nothing
    }
    .padding(50)
    .background(.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .overlay {
        Circle()
            .stroke(.red)
            .scaleEffect(animationAmount)
            .opacity(2 - animationAmount)
            .animation(
                .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                value: animationAmount
            )
    }
    .onAppear(perform: {
        animationAmount = 2
    })
}
```

- A spinning on tap button

```swift
@State private var animationAmount = 1.0

var body: some View {
    Button("Spin!") {
        withAnimation(.interpolatingSpring(stiffness: 20, damping: 3)) {
            animationAmount += 360
        }
    }
    .padding(50)
    .background(.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.5, y: 0.5, z: 0))
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
