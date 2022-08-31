# [Day 50](https://www.hackingwithswift.com/100/swiftui/50)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
29th August, 2022

> I hope you can look at Apple’s iOS apps and be inspired by them: their UI is often uncomplicated, but they put a ton of work into getting the details right so the whole experience feels great.

> Pro tip: Before we get into the UI, we need to start by defining the data model.

- In this project, all data will be inside one single class that is passed from screen to screen.
- Each of the properties inside this class need to update the UI when changed.
- This means marking them with `Published` and marking the class with `ObservableObject`.
- Instance of this class is only created in the `ContentView.swift` file. Every other file is shared this instance.

### Adding a toggle
- It will take a title string and a isOn parameter.
- You can have other toggles with a boolean attached that slide in only when the parent toggle is switched on or off.
- Add `.animation()` to the parameter for a smooth slidiing in and out if you add an if condition.

```swift
Toggle("Any special request?", isOn: $order.hasSpecialRequest.animation())

if order.hasSpecialRequest {
    Toggle("Add extra frosting", isOn: $order.hasExtraFrosting)
    
    Toggle("Add extra sprinkles", isOn: $order.wantsSprinkles)
}
```

- Advantage of classes that you'll notice is that even when you go back and forward using the navigation view, it still stores the data as the object isn't destroyed.
- Whereas if we wanted the data to be rest, we should use the structs inside class approach from project 7.
- This acts as a feature in itself.

### Advantage of having a image to be remote vs on device storage.
- It allows us to swap it with something else during discount seasons or festivals.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋