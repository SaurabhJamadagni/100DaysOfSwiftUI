# [Day 23](https://www.hackingwithswift.com/100/swiftui/23)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
20th July, 2022

### Why does SwfitUI use structs instead of classes for views?

- Unlike UIKit which uses classes for views, SwiftUI uses structs.
- One of the reasons is speed. Structs are just faster and more efficient than classes. But that is not the only reason.
- In UIKit, everything is inherited from a super class created by apple. Whereas in SwfitUI, if your struct has a single variable, that is all your view has, making it extremely light weight.
- The difference is most noticed when changing values. Classes can change the values inside quite freely.

  > Structs contain exactly what we say.

- Understand that their is nothing behind the main view.
- There is no point reaching outside the content view. Just consider that as your screen and work with it.

### Importance of modifier order

- When we apply a modifier to a view, we create a copy of the view with the applied changes.
- Consider applying a frame to a button and then a colour.

```swift
// This will first create your view, then a red button and then a frame
// due to this the entire frame will not have the red color
// It will appear as if the button text is highlighted.
Button("Hello, world") { }
    .background(.red)
    .frame(maxWidth: .infinity, maxHeight: .infinity)


// the more optimal way to do this, considering you want the entire frame to be coloured
Button("Hello, world") { }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.red)
```

### What happens when we use VStack?

- How does SwiftUI figure out what is being returned from the VStack. It could literally be anything. A button, an image, we can't say.
- SwiftUI create something called as a `TupleView` that is returned.
- That's why we currently have the limitation of 10 views inside the VStack.
- SwiftUI **internally** currently only knows how to handle a `TupleView` that has 10 views inside it.

### What happens without a VStack?

- It automatically attaches the attribute `@ViewBuilder` and the views inside are converted to a TupleView again.
- That's why in our main view as well, we have the 10 view limitation.

### Conditional modifiers

- We can use the ternary operator to conditionally apply a certain modifier.

```swift
struct ContentView: View {
    @State private var isCorrect = false

    var body: some View {
        Button("Answer") {
            isCorrect.toggle()
        }
        .foregroundColor(isCorrect ? .green : .red)
    }
}
```

### Environment modifiers

- We can directly apply a modifier to a container so that the modifier is applied to all views inside it.
- But the child modifier, i.e. any modifier to the views inside can override the environment modifier.
- But not all modifiers are environment modifiers.
  - For example, if we apply a blur to a VStack so that all views have a blur, we cannot go in and add a child modifier that says this view has less blur.
- There's no actual way of telling which modifiers are environment modifiers. Only way is to read through the documentation.

### View Composition

- You can create a property out of a view that is later used in the body.
- This increases the readability of the body.
- Suppose you want to create two text views that have the same kind of formatting.

```swift
var body: some View {
    VStack(spacing: 10) {
        Text("First")
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())

        Text("Second")
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}
```

- This can be simplified by creating a new struct, let's call it `CapsuleText`

```swift
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}
```

- Thus our main body is simplified to

```swift
var body: some View {
    VStack(spacing: 10) {
        CapsuleText(text: "First")
        CapsuleText(text: "Second")
    }
}
```

### Custom modifiers

- It conforms to the `ViewModifier` protocol and has to have the function body.

```swift
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
    }
}
```

- To use this custom modifier we can use `.modifier(Title())` wherever we want to use it.
- To make it easier to use the custom modifier, we can extend the `View` protocol as such.

```swift
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
```

- Remember, modifiers return new objects with some view attached. **They can do much more than just apply other modifiers.**
- When you have custom view modifiers, you can add custom properties.

### Custom containers

- Custom containers utilize a bit of advanced Swift and make use of Generics.
- I would recommend checking the video out instead of the notes for the best explanation.
- link: https://www.hackingwithswift.com/books/ios-swiftui/custom-containers

### Summary

- Structs are used for views as they are faster and also because they will contain exactly what we want and expect. They are just simpler to work with.
- Modifier order is important as each time a modifier is applied a copy of the view is created with the applied changes.
- `TupleView` is returned when working with multiple views. An automatic attribute called `ViewBuilder` comes into play.
- We can have conditional modifiers using the ternary operator.
- Break down views into smaller parts for better composition and understanding. Do not worry about efficiency.
- Custom modifiers can be made by adopting the `ViewModifier` protocol. A convenient way to use them is to extend the View protocol.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
