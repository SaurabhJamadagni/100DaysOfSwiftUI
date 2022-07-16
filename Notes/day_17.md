# [Day 17](https://www.hackingwithswift.com/100/swiftui/17)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
15th July, 2022

### Reading user input

- We need the user's input on stuff like how much is the total bill, how many people to split between, etc.
- A TextField expects text (obviously). Thus you can't take the total amount as input directly from the text field.
- Here we can use the parameter `value` which will be followed by a `format` of value. In our case it will be a `.currency` with `code: "USD"`.
- But USD is not the currency everyone will opt for.
- So here we can use `Locale.current.currencyCode ?? "USD"`
- `Locale` is a massive struct that deals with the local information of the user such as what currency, what kind of a calendar format, etc.
- We can use a different kind of keyboard using `.keyboardType`. In this case, we want a decimal pad instead of the normal letter keyboard.

### Pickers in SwiftUI

- A picker outside a form can look like a scrolling wheel. But inside a form it will take you to a new view to select from the options.
- This is good because depending on the platform, it will do the right thing for that specific platform. We can ofcourse override it.
- But if it is not wrapped inside a navigation view, SwiftUI can't slide between different views. So even after clicking, it won't show us the options.

### Segmented Control Picker

- It is useful when you only have a handful of options to show.
- Use `.pickerStyle(.segmented)`

### Section headers and footers

- Instead of having a text view to show what the contents of the section is supposed to do, we can have a header closure.

```swift
Section {
    // first closure stating what does the section body have
    ..........
    ....
    ..........
    ..
} header: {
    Text("How much tip do you wish to leave?")
}
```

### Dismissing the decimal pad

- Unlike an alphabet keyboard which has a done button on it, a decimal or a num pad doesn't have any button to dimiss it.
- Here we need to check if the field that takes the input through the keyboard is in focus or not.
- This can be done using the `@FocusState` state.
- We can then create a new view using `.toolbar` which is used to display tool items that may appear in the nav bar, above the keyboard, etc.
- We create a `ToolBarItemGroup(.keyboard)`.
- In it we can create a Button that toggles the `@FocusState` to false.

> Pro Tip: Use `Spacer()`. It will push all the other components to the end of the view taking up all the space based on where it is used chronologically.

```swift
.toolbar {
    ToolbarItemGroup(placement: .keyboard) {
        Spacer()

        Button("Done") {
            amountIsFocused = false
        }
    }
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
