# [Day 36](https://www.hackingwithswift.com/100/swiftui/36)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
1st August, 2022

> Nobody should start to undertake a large project. You start with a small trivial project, and you should never expect it to get large. If you do, you'll just overdesign and generally think it is more important than it likely is at that stage. Or worse, you might be scared away by the sheer size of the work you envision.
>
> Linus Torvalds

### Limitations of the State property wrapper

- It is useful till you have to work with simple data that is local to the current view. It does not work for multiple views to be able to share data.
- Basically if you share a struct with two views, they each get their own copy of the struct and the changes are not shared.
- Whereas classes send the same copy to both the views and **changes are shared**.

### Using StateObject

- When we wish to reflect the changes made to a property of a class across views we can use the StateObject property wrapper.
- This requires the class to conform to the `ObservableObject` protocol.
- We use the `@Published` property observer for the properties we want to reflect changes across view in from the class.
- These are the three changes you have to make when switching from using `@State` to `@StateObject` to reflect immediate changes in views.
- When you have created an instance of a class in some view and wish to use it in another view, you must use the `@ObservedObject` property wrapper.

### Showing different views

- One of the ways of doing that is using something called a sheet.
- sheets work similar to alerts. That is we don't call them. They are bound to some value which automatically triggers presenting the sheet.
- use `sheet` as a modifier and pass the value it is bound to to the parameter isPresented.
- Next we must define what happens when the sheet is loaded.

**How will a sheet be dismissed?**

- To dismiss a view we have to make use of another property wrapper `@Environment`. It stores values provided to us externally. For example, is the user using dark or light mode, etc.
- Create a property dismiss using `@Environment(\.dismiss) var dismiss`.
- This property will be callable from whichever button you assign to perform this action in that view.

### onDelete

- `onDelete()` modifier for us to use to control how objects should be deleted from a collection
- We may have a case where the List consists of only dynamic rows using ForEach which we can simplify by passing in the List itself.
- But, onDelete only works with ForEach.
- In order to make onDelete() work, we need to implement a method that will receive a single parameter of type `IndexSet`.
- We can also add a EditButton() to the toolbar so that it allows us to delete mulitple lines. The edit button is replaced by Done in edit mode.

### Storing user settings

- Common way to store a small amount of data is called `UserDefaults`. It’s great for simple user preferences.
- SwiftUI can often wrap up UserDefaults inside a nice and simple property wrapper called `@AppStorage` – it only supports a subset of functionality right now, but it can be really helpful.

```swift
@State private var tapCount = 0

var body: some View {
    Button("Tap count: \(tapCount)") {
        tapCount += 1
        // learn more about this
        UserDefaults.standard.set(self.tapCount, forKey: "Tap")
    }
}
```

- We attach a string name to this data. The key is important – we need to use the same key to read the data back out of UserDefaults.

- We can read from the UserDefaults too. For example,

```swift
@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
```

- It takes iOS a little time to write your data to permanent storage
- We can use the `@AppStorage` property wrapper instead. We then pass the key in parenthesis.
- It allows us to make a variable directly read and write to the UserDefaults. That way we don't have to even use the `set()` function. Any changes to the variable are reflected in storage.

### Archiving with codable

- `Codable` protocol allows us to add complex data like structs to UserDefaults by **encoding to JSON or decoding from JSON**.
- Other types are available but JSON is by far the most common.
- To encode we must create a `JSONEncoder` object.
- The type `Data` is allowed in UserDefaults. Encoder converts our struct into the `Data` type.

```swift
let encoder = JSONEncoder()

if let data = try? encoder.encode(user) {
    UserDefaults.standard.set(data, forKey: "UserData")
}
```

- To decode it, we can use the `JSONDecoder`.

### Summary

- `@State` property wrapper is limited when it comes to sharing data across multiple views.
- To share data we must use classes and the `@StateObject` or `@ObservedObject` property wrapper.
- A `sheet` can be used to present a new view. It works similar to alerts.
- `onDelete` works with ForEach and allows us to have a simple implementation in place that allows us to delete rows from a collection.
- We can use `UserDefaults` to store small amounts of data such as user preferances or use the property wrapper `@AppStorage` to do the same.
- For complex types, we must use the `Codable` protocol and directly access UserDefualts to store data.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
