# [Day 16](https://www.hackingwithswift.com/100/swiftui/16)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
11th July, 2022

### Basic structure of a swiftUI project
- The `...App` file is responsible for configuring the initial launch of our app.
- The content view contains the main UI of the program.
- The `ContentView` struct conforms to the `View` protocol. It involves everything that you may see on your screen, all the images, buttons, nav bars, etc.
- View protocol only requires the body property. Everything else is your choice to add.
- The preview will show you what your UI will look. Don't confuse it with a simulator. That is different
> Pro tip: Use the shortcut `option + cmd + P` to resume preview whenever it is paused.

### Forms
- Forms are scrolling lists of static views which can contain text and images but also interactie elements such as toggle switches, text fields, buttons and so on.
- Currently it is a **limitation** of forms that you cannot add more than 10 items to it. 
- After that you need to start making groups.
- If you want to make the elements look visibly part of different groups, use `Sections`.

### Adding a navigation bar
- A rectangular area is marked as the Safe Area so that our UI elements do not overlap with the System UI.
- Wrapping everything inside a navigation view provides us with a navigation bar. A navigation view does so much more but that shall be discussed later.
- Attaching the form with a `.navigationTitle("Title")` will give us a large Title.
- We can also have a smaller titel using `.navigationBarTitleDisplayMode(.inline)`

### Program States
- The active collection of the settings, the preferences at the instant is known as a program state.

> SwiftUI's Views are a function of their state.

### Creating a button
```swift
Button("String inside the button") {
    // action that should be performed after the button is pressed.
}
```
- Swift will allow us to create a mutating struct but not a mutating computed property. 
- So how do you makes changes to the view?
- This can be done using property wrappers. `@State` property wrapper can tell that this property is part of our current active state.
- This allows us to make change to the property.
- Apple reccommends we make these values local by using the private access modifier.

### Binding states
- Swift won't let us create a textfield unless we don't have an actual place to store it in the struct.
- It also won't allow us to create the field if the variable doesn't show exactly what is present in the field. 
- Thus these two need to be bound together.
- This is done using the `$` sign. It tells swift that it should read from this variable but also write to it.

```swift
@State private var name = ""
  
var body: some View {
    Form {
    TextField("Enter you name: ", text: $name)
    Text("Hello world")
    }
}
```

### ForEach
- Useful when you want to loop to create views. For example, if you want to loop over an array and have each element in a new text view.
- `ForEach` is not limited to 10 by SwiftUI.
- This will run a closure each times for the mentioned number of times.
```swift
var body: some View {
      Form {
        ForEach(0..<20) { number in
          Text("Row \(number)")
        }
      }
    }
```

### Adding a picker
- A `Picker` takes a `selection` parameter which has to be binded.
- It is followed by a closure, which houses the options you want to show in the picker.
- We can do a simple `ForEach` in here.
```swift
let students = ["Harry", "Hermoine", "Ron"]
    @State private var selected = "Harry"

    var body: some View {
      Form {
        Picker("Selected student", selection: $selected) {
          ForEach(students, id: \.self) {
            Text($0)
          }
        }
      }
    }
```
- Here the selecetion is stored inside `selected`.
- The for each takes an id for unique identification. If it were structs that we were passing, we could have a id property inside them.
- But for an array of strings, the most unique property is the string itself. Thus we make the string its own id. This would cause problems with duplicates.
- `Text($0)` essentially means show the element of the array as a text view.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋