# [Day 33](https://www.hackingwithswift.com/100/swiftui/33)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
29th July, 2022

### Animation stack

- We can apply the animation modifier several times, and the order in which we apply them matters!
- Only the changes applied before the animation modifier get animated.
- So in case you use several animation modifiers, each one animates every change before it upto the previous animation modifier.

### Animating gestures

- Firstly, we need some variable to store the amount the user has dragged the element.
- Add a `.gesture` modifier that holds the `DragGesture`.
- This will take two modifiers `onChanged` and `onEnded`.

```swift
// a simple card moving around animation
@State private var dragAmount = CGSize.zero

var body: some View {
    LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        .frame(width: 300, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    withAnimation(.interpolatingSpring(stiffness: 50, damping: 8)) {
                        dragAmount = .zero
                    }
                }
        )
}
```

### Showing and hiding views using transitions

- We can add a if statement based on a boolean that shows or hides a view.
- To smoothen the animation, we can add transtions using the `.transition` modifier.

### Building custom transitions

- Have to conform to the `ViewModifier` protocol.
- We can then directly use this struct for the transition but a better way is to extend `AnyTransition` protocol.

```swift
// Custom transition struct
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

// extending the AnyTransition protocol
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


// For the main content view
struct ContentView: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
