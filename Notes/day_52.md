# [Day 52](https://www.hackingwithswift.com/100/swiftui/52)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
2nd September, 2022

- Challenge and Review day for Project 10 - Cupcake Corner

### Challenge - 1
- Change the check so that address isn't valid if the entered characters are just whitespaces.
  - Add the following code to `hasValidAddress`.

```swift
if name.replacingOccurrences(of: " ", with: "").isEmpty || streetAddress.replacingOccurrences(of: " ", with: "").isEmpty || city.replacingOccurrences(of: " ", with: "").isEmpty || zip.replacingOccurrences(of: " ", with: "").isEmpty {
    return false
}
```

### Challenge - 2
- Add an alert that tells the user if the networking call was interrupted by a loss in network connection.
  - To imitate a failed request, comment the line that says `request.httpMethod = "POST"`
  - We can do this when the networking call in `placeOrder()` throws an error.
  - Create the required variables and bind them to the alert with the the right alert message and trigger it in the catch block.

```swift
// In the catch block
alertTitle = "Sorry!"
confirmationMessage = "Couldn't place your order. Please check your internet connection."
showingConfirmation = true
```

### Challenge - 3 (WIP)
- convert the data model from a class to a struct. Create an ObservableObject wrapper class around it this will lead to having just one @Published property inside which you hold the data.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋