# [Day 26](https://www.hackingwithswift.com/100/swiftui/26)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
22nd July, 2022

### Inputting numbers in SwiftUI

- There are two ways to enter input numbers in SwiftUI - steppers and sliders.
- Steppers are more preciese with a `+` and `-` button and work with any number type you want.
- A stepper can go to the limits of the data type it is bound to.
- But we can bound it over a range using `in: range`.
- A step value can also be provided.

```swift
Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
```

### Date picker in SwiftUI

- We can assign the current date and time of the user to a variable using `Date.now`.
- We can skip adding a label to the date picker but shouldn't.
- To hide the label we can use the `.labelIsHidden` modifier.
- We can also choose which components are displayed.
- We can also specify a range for the date picker using `in`.

### Working with Dates

- Dates are hard! During DLS, you may have to account for an additonal hour.
  - During September, 1752 it was needed to account for the shift to the gregorian calendar. Thus a bunch of dates are just missing to catch up to the actual date.
- We should let the apple framework deal with the calculation of dates instead of saying `tomorrow = Date.now.addingTimeInterval(86400)`.
- Utilise date components.
- **Date components are all optional**. So remember to unwrap them correctly.
- We can also format using format: .dateTime().day().month().year(). We are not specifying a order here. It will use the format using the user's region automatically.
- Some other ways of formatting,
  - `Date.now.formatted(date: .long, time: .shortened)`
  - `Date.now.formatted(date: .long, time: .omitted)`

### Training ML models on-device

- This was made possible by Core ML and then made easier by Create ML.
- The concept we are going to use in this project is known as Tabular Regression. That is, it basically makes prediction based on the data provided in a tabular form using regression once the model is trained.
- We create a new document in Create ML (Found in XCode developer tools).
- The `Target` is the feature you want the model to predict.
- You can experiment with different algorithms.
- Importing the ML model file into XCode automatically generates a class for the model.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
