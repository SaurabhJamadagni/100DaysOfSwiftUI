# [Day 70](https://www.hackingwithswift.com/100/swiftui/70)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
25th November, 2022

### Adding locations to map
- We can create a button that adds whatever location is at the center of the map.
- We can access the coordinates of the center location using the mapRegion.
- Use: `mapRegion.center.latitude` OR longitude
  
### Customising the map markers.
- Use MapAnnotations for that like we saw previously.
- **Apple recommends that anything interactive should have a minimum touch area of or size of 44x44.**
- Therefore, the frame for the markers will have width and height 44.
- Also, always create an example instance whenever you create a new data type.

> It is a good idea to write a equatable function if comparing just one property is enough to compare two instances of that data type.

```swift
static func ==(lhs: Location, rhs: Location) -> Bool {
    lhs.id == rhs.id
}
```

### Selecting and editing map annotations
- So far we have used a boolean to trigger a sheet. This time if we use a optional of type Location, it will trigger the sheet as soon as it is **not nil**.
- Great thing is it will be again set to nil when the sheet is dismissed.
- This kind of optional binding isn’t always possible, where it is possible it makes for much more natural code.

- An initializer is required if a state variable does not havea defualt value. Example,
```swift 
init(location: Location) {
    self.location = location

    _name = State(initialValue: location.name)
    _description = State(initialValue: location.description)
}

// Take note of State(initialValue: )
```

- @escaping means the function is being stashed away for user later on, rather than being called immediately, and it’s needed here because the onSave function will get called only when the user presses Save.

- Cool thing is if you have a function that takes a parameter but returns nothing as a variable, then you can alter variables across views.
- Thus the initalizer becomes,

```swift
init(location: Location, onSave: @escaping (Location) -> Void) {
    self.location = location
    self.onSave = onSave

    _name = State(initialValue: location.name)
    _description = State(initialValue: location.description)
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋