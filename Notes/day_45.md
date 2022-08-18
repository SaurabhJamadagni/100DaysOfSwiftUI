# [Day 45](https://www.hackingwithswift.com/100/swiftui/45)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
18th August, 2022

### Special effects in SwiftUI
- Blend modes control how one view is rendered on top of the other.
- Multiply is a blend mode. To give a vague description of how this mode works it that the rgb values for each pixel are respectively multiplied for both the layers.

```swift
ZStack {
    Image("Example")

    Rectangle()
        .fill(.red)
        .blendMode(.multiply)
}
.frame(width: 400, height: 500)
.clipped()
```

- Playing around with the screen blending mode

```swift
var body: some View {
    VStack {
    ZStack {
        Circle()
        .fill(.red)
        .frame(width: 200 * amount)
        .offset(x: -50, y: -80) // Moves the circle to the left and above the center
        .blendMode(.screen)
        Circle()
        .fill(.green)
        .frame(width: 200 * amount)
        .offset(x: 50, y: -80)  // Moves the circle to the right and above the center
        .blendMode(.screen)
        Circle()  // Circle will be at the center
        .fill(.blue)
        .frame(width: 200 * amount)
        .blendMode(.screen)
    }
    .frame(width: 300, height: 300)
    
    Slider(value: $amount)
        .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.black)
    .ignoresSafeArea()
}
```

### animatableData
- Create a shape to test this out with. Let's do a simple trapezoid with different inset values.

```swift
struct Trapezoid: Shape {
  var insetAmount: Double
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    path.move(to: CGPoint(x: 0, y: rect.maxY))
    path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: 0, y: rect.maxY))
    
    return path
  }
}
```

- Let's add an onTapGesture that changes the inset when the trapezoid is tapped.

```swift
@State private var insetAmount: Double = 50.0
    
var body: some View {
    Trapezoid(insetAmount: insetAmount)
    .stroke(.red, lineWidth: 2)
    .frame(width: 300, height: 200)
    .onTapGesture {
        withAnimation {
            insetAmount = Double.random(in: 10...90)
        }
    }
}
```

- You will notice that the shape just jumps to the new state and we can't see the animation.
- To fix that we add a computed property called animatableData to the shape.

```swift
var animatableData: Double {
    get { insetAmount }
    set { insetAmount = newValue }
}
```

- animatableData tracks the changes in the value over time as part of the animation.
> As the animation progresses, SwiftUI will set the animatableData property of our shape to the latest value, and it’s down to us to decide what that means – in our case we assign it directly to insetAmount

- When a randome Double is chosen to animate, it will interpolate between the current value and the new value.

### AnimatablePair
- animatableData is used to animate data. But as its a property, it can only have one value. So how do you animate multiple shapes.
- You can have only one value, but what kind of value that is can depend.
- We can wrap two values inside a special wrapper called AnimatablePair.

- Create a checkerboard for example (This one's pretty cool!!)

```swift
struct CheckerBoard: Shape {
  var rows: Int
  var columns: Int
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    let cellHeight = rect.height / Double(rows)
    let cellWidth = rect.width / Double(columns)
    
    for row in 0..<rows {
      for column in 0..<columns {
        if !(row + column).isMultiple(of: 2) {
          // it means the square needs to be coloured
          let startX = cellWidth * Double(column)
          let startY = cellHeight * Double(row)
          
          let cell = CGRect(x: startX, y: startY, width: cellWidth, height: cellHeight)
          
          path.addRect(cell)
        }
      }
    }
    
    return path
  }
}
```

- **Swift cannot interpolate integers**
- So how to have more than two values if its a AnimatablePair?
- We can couple them AnimatablePair with AnimatablePairs inside.
- Then just dig through them using code such as newValue.second.second.first.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋