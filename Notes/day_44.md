# [Day 44](https://www.hackingwithswift.com/100/swiftui/44)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
13th August, 2022

### CGAffineTransform and even-odd fill
- `CGAffintTransform` describes how a path should be rotated, scaeled or sheared.
- Even odd fill allows us to describe how overlapping shapes should be filled.

> Rotating something then moving it does not produce the same result as moving then rotating, because when you rotate it first the direction it moves will be different from if it were not rotated.

- To count in strides that are not just unit steps (for which we can just use range), we use `stride(from:to:by:)`.

```swift
// Drawing a flower

struct Flower: Shape {
  var petalOffset: Double = -20
  var petalWidth: Double = 100
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
      // rotate the petal first
      let rotation = CGAffineTransform(rotationAngle: number)
      
      // move to the center of the view
      let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
      
      // Draw the petal
      let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
      
      let rotatedPetal = originalPetal.applying(position)
      
      path.addPath(rotatedPetal)
    }
    
    return path
  }
}

// To visualise the offsets, create sliders that can change the offset and width values
@State private var petalOffset: Double = 0
@State private var petalWidth: Double = 100

var body: some View {
    VStack {
    Flower(petalOffset: petalOffset, petalWidth: petalWidth)
        .stroke(.red, lineWidth: 1)
    
    Text("Offset")
    Slider(value: $petalOffset, in: -40...40)
        .padding([.horizontal, .bottom])

    Text("Width")
    Slider(value: $petalWidth, in: 0...100)
        .padding(.horizontal)
    }
}
```
 
 - Instead of a stroke we can use a fill.
 - Use FillStyle(eoFill: true) to get an even-odd fill.
   - If a part has odd number of overlaps, it will be filled.
   - Otherwise, it won't.

### ImagePaint
- Color conforms to Views, so do images. But Color also conforms to ShapeStyle protocol. Thus we can use it to style shapes. Example, use it for border color or fill.
- We can't do so with images.
- To work with this, we can use ImagePaint.
- A basic example to use an image for a border,

```swift
Text("Hello World")
    .frame(width: 300, height: 300)
    .border(ImagePaint(image: Image("Example"), scale: 0.2), width: 30)
```

### Using Metal
- Rendering complex paths and drawing can get very difficult for Core Animation.
- To help with this, Apple's framework Metal comes into play.
- It tells SwiftUI to render the contents on an off-screen image before putting it back onto the screen.
- This can be achieved using the modifier `.drawingGroup()`
- Note: Do not use drawingGroup every time. Sometimes it can lead to slowing down of SwiftUI instead. Wait till you notice a performance problem and only then resort to Metal.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋