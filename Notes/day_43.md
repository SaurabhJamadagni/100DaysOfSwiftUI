# [Day 43](https://www.hackingwithswift.com/100/swiftui/43)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
11th August, 2022

### Drawing in SwiftUI
- The underlying systems are the same for SwiftUI - Core Animation and Metal.
- When the drawing has complex paths or just gets complex, SwiftUI changes to using Metal. It can almost use these two interchangably.
- Paths are also views.
- It takes a single argument that is used to draw.
- The problem with this is the way you draw does depend on the device you draw it on. It will not automatically adapt as you change devices.

```swift
// Drawing a triangle example.

Path { path in
    path.move(to: CGPoint(x: 200, y: 100))
    path.addLine(to: CGPoint(x: 100, y: 300))
    path.addLine(to: CGPoint(x: 300, y: 300))
    path.addLine(to: CGPoint(x: 200, y: 100))
}
```

- If you convert the triangle to one that has a stroke insted of a fill for its shape, you will notice the last edge doesn't connect nicely.
- This can be fixed using `path.closeSubpath()`
- Anothe method can be to use StrokeStyle. It allows us to choose how our lines are connected. This means we can also specify nice rounded connections.

```swift
Path { path in
    path.move(to: CGPoint(x: 200, y: 100))
    path.addLine(to: CGPoint(x: 100, y: 300))
    path.addLine(to: CGPoint(x: 300, y: 300))
    path.addLine(to: CGPoint(x: 200, y: 100))
}
.stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
```

- lineCap is used to determine how the last line connects. lineJoin is for all other points of connection.

### Shapes and more on Paths
- Unlike Paths, for which we have to mention the exact coordinatates, shapes don't require that. In shapes, you only have to mention that please draw this shape inside this rectangle.

```swift
// Creating a triangle using shape

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}
```

- We can apply the stroke modifier to a shape too. Just make sure to mention the size of the frame.

- Let's create an arc

```swift
struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return path
    }
}

// Inside body
Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
    .stroke(.blue, lineWidth: 10)
    .frame(width: 300, height: 300)
```

- You will notice that you don't get what you expected by mentioning the angles.
- Shapes measure their coordinates from the bottom-left corner rather than the top-left corner, which means SwiftUI goes the other way around from one angle to the other.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋

