# [Day 24](https://www.hackingwithswift.com/100/swiftui/24)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
20th July, 2022

### Challenge - 1

- Change the total amount Text to be red in color if the user selects 0% tip.

```swift
Text(finalAmountWithTip, format: currencyCode)
    .foregroundColor(tipPercentage == 0 ? .red : .primary)
```

### Challenge - 2

- Replace Image view that renders flags with a new FlagImage() view that renders the flags accordingly
  - We create a struct FlagImage that conforms to the View prootocol
  - We then create a property inside it that holds the string of the flag that needs to be printed.
  - Following will be the changes to the code.

```swift
// required struct
struct FlagImage: View {
    var country: String

    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

// where we give the button the label
label: {
    FlagImage(country: countries[number])
}
```
