# [Day 39](https://www.hackingwithswift.com/100/swiftui/39)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
4th August, 2022

### GeometryReader

- We could use a the `resizable` modifier for the image view but it affects its proportions.
- To maintain proportions, we can use scaled ot fill or scale to fit.
- The first of these means the entire image will fit inside the container even if that means leaving some parts of the view empty, and the second means the view will have no empty parts even if that means some of our image lies outside the container.
- But screen sizes differ. We should be able to dynamically adapt the image depending on the screen size.
- `GeometryReader` is a view just like the others we’ve used, except when we create it we’ll be handed a GeometryProxy object to use.

> Tip: If you ever want to center a view inside a GeometryReader, rather than aligning to the top-left corner, add a second frame that makes it fill the full space of the container.

```swift
var body: some View {
    GeometryReader { geo in
        Image("rock-bg")
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width * 0.8)
            .frame(width: geo.size.width, height: geo.size.height)
            // For the second frame
            // taking away the height parameter will center the image horizontally only
            // taking the width away will center it vertically.
    }
}
```

### Scroll Views

- To add scrolling functionality to arbitrary views we have created, we need to use `ScrollView`.

```swift
// A basic VStack with 100 Text Views
ScrollView {
    VStack(spacing: 10) {
        ForEach(0..<100) {
            Text("Item \($0)")
                .font(.title)
        }
    }
    .frame(maxWidth: .infinity) // makes the scrollabe touch area the entire width of the screen
}
```

- A scroll view will create all the views inside it immediately. It won't wait for you to scroll to that element to create it. We can immediately understand the efficiency consequences of this.
- To counter this, we can use `LazyHStack` and `LazyVStack`.
- They work the same way as the normal stacks but they load their content on demand. This minimized the system resources being used.
- A lazy stack fill take up all the available space unlike a normal stack which only uses as much space as required on the screen.
- We can make horizontal scroll views by passing `.horizontal` as parameter in the ScrollView.

### Pushing new Views on the stack using Navigation Link

- `NavigationLink` basically allows us to direct to a different view from any view.

```swift
var body: some View {
    NavigationView {
        NavigationLink {
            Text("Detail View")
        } label: {
            Text("Hello, world!")
                .padding()
        }
        .navigationTitle("SwiftUI")
    }
}
```

- Here `Hello, World!` turns into a button that directs us to a view that has the Text View with `Detail View `in it.
- Also the `navigationTitle` turns into a back button. Also a swipe gesture is allowed to return to the previous view. All of this is done by just creating a NavigationLink! How cool is that!!
- The most common place you see NavigationLink is with a list.

```swift
NavigationView {
    List(0..<100) { row in
        NavigationLink {
            Text("Detail \(row)")
        } label: {
            Text("Row \(row)")
        }
    }
    .navigationTitle("SwiftUI")
}
```

- Here each row will have a linked detail row view.

### Working with hierarchical Codable data

- To work with data that has a hierarchy of different data types and various arrays inside it, it is best to create a different struct for each level of hierarchy.
- There is no limit on the depth of heirarchy `Codable` will support. We must make sure to create the required structs to decode it.
- For example, consider the input

```JSON
{
    "name": "Taylor Swift",
    "address": {
        "street": "555, Taylor Swift Avenue",
        "city": "Nashville"
    }
}
```

- We must create the required structs to suit this hierarchy

```swift
struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}
```

- Now we can decode it using the `JSONDecoder`

```swift
let data = Data(input.utf8)
let decoder = JSONDecoder()
if let user = try? decoder.decode(User.self, from: data) {
    print(user.address.street)
}
```

### Scrolling grid

- We can have rows of data, but we may need columns too that provide additional information. Basically we require a grid of information.
- In SwiftUI this is accomplished with two views: `LazyHGrid` for showing horizontal data, and `LazyVGrid` for showing vertical data.
- We first must define the kind of grid we want. That includes either declaring how many rows we want **OR** the columns.

```swift
let layout = [
    GridItem(.fixed(80)),
    GridItem(.fixed(80)),
    GridItem(.fixed(80))
]

var body: some View {
    ScrollView {
        LazyVGrid(columns: layout) {
            ForEach(0..<1000) {
                Text("\($0).")
                Text("HI")
                Text("I'm \($0)")
            }
        }
    }
}
```

- We can also have adaptive number of `GridItems` that says that we are ok with as many columns as there can be on the screen of the specified size.
- The changes to layout are

```swift
let layout = [
    GridItem(.adaptive(minimum: 80, maximum: 120)),
]
```

### Summary

- `GeometryReader` is a powerful method of resizing images. It has more and powerful funcitonality that will be explored later.
- A `ScrollView` allows us to add scrolling functionality to the arbitrary views we create.
- You can also have it scroll horizontally by passing it as a parameter.
- `NavigationLink` is another method that takes you to a different view. We provide the destination and a view that should be clicked and the function is performed accordingly.
- We can work with hierarchical data using the Codable protocol. That requires us to create the required structs for each level.
- A scrolling grid can be created using `LazyVGrid` or `LazyHGrid`. It requires us to define the layout in which it will show the grid. We must mention the number of rows OR columns.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
