# [Day 54](https://www.hackingwithswift.com/100/swiftui/54)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
14th September, 2022

### Creating custom components
- Create a new view.
- Usually you will want it to be just applicable with your project. But, no harm in creating it such that you can reuse the component later.

```swift
struct RatingView: View {
    // This is the value the UI component works around.
    @Binding var rating: Int
    
    // Certain properties are additional so that the component becomes reusable.
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            Spacer()
            
            // Check if there is a label
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
            
            Spacer()
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}
```

> Pro tip: Use constant bindings with Previews. They can't be changed in the UI but work just fine with previews.

- Core data managed objects conform to Identifiable automatically.
- All properties of a Core Data entity are optional. So when creating Views, we need to keep in mind to make use of nil coalescing.

### Fetching data
- Array of `FethchedResults<Books>` is used to store the results using a fetch request.
- Followed by a simple list that displays the results.
- A custom emoji view that returns a certain emoji based on the ratings also created.
  
Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋