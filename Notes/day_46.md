# [Day 46](https://www.hackingwithswift.com/100/swiftui/46)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
20th August, 2022

- Challenge and review day for Project 9 - Drawing

### Challenge - 1 & 2
- Create an arrow shape and animate its line thickness

```swift
struct Arrow: Shape {

  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.midX, y: 0))
    path.move(to: CGPoint(x: rect.width / 4, y: rect.height / 4))
    path.addLine(to: CGPoint(x: rect.midX, y: 0))
    path.move(to: CGPoint(x: rect.width * 3 / 4, y: rect.height / 4))
    path.addLine(to: CGPoint(x: rect.midX, y: 0))
    
    
    return path
  }
}

// In the Content body
VStack(spacing: 0) {
    Spacer()
    Arrow()
        .stroke(.primary, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        .frame(width: 300, height: 300)

    Spacer()

    Text("Line Width")
        .font(.title)
    Slider(value: $lineWidth, in: 2...20)
        .padding([.horizontal, .bottom])
}
```

### Challenge - 3 (WIP)
- Create a Colour rectangle like a colour wheel

