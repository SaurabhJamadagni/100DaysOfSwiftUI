# [Day 71](https://www.hackingwithswift.com/100/swiftui/71)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
1st December, 2022

### Downloading data from Wikipedia
- Wikipedia returns a very specific format of json, so decode accordingly.
- Use enum to switch between states. It is good practice and also so much simpler than guessing what a boolean will be at a certain state.

```swift
case .loaded:
    ForEach(pages, id: \.pageid) { page in
        Text(page.title)
            .font(.headline)
        + Text(": ") +
        Text("Page description here")
            .italic()
    }
```

- Notice how we can use + to add text views together? This lets us create larger text views that mix and match different kinds of formatting. 

### Sorting Wikipedia results
- This will be done using the Comparable protocol.
- It allows us to compare different instances of a struct. (More on this protocol later, soon in a blog post)
- But, comparable compares every property of the struct for the instances to determine the relation.
- In this case we just have to compare the titles.
- So basically overload the comparison operator.

```swift
static func <(lhs: Page, rhs: Page) -> Bool {
    lhs.title < rhs.title
}
```
- Notice it is a static function at it is a function of the struct and not a particular instance.
- Sometimes the result froma URL will have optionals and garbage conditionals that will only make your code messy. 
- In this case create computed properties in the struct itself that do that to keep things cleaner.