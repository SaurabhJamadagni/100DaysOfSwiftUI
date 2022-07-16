# [Day 18](https://www.hackingwithswift.com/100/swiftui/18)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
16th July, 2022

### Challenge - 1

- Add a header to the third section, saying “Amount per person”
  - Can be done using a simple `header` trailing closure to the section.

```swift
header: {
    Text("Amount per person")
}
```

### Challenge - 2

- Add another section showing the total amount for the check
  - We can do this by creating a new section and adding a Text view to it.

```swift
Section {
    Text(finalAmountWithTip, format: currencyCode)
} header: {
    Text("Total amount including tip")
}
```

### Challenge - 3

- Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%
  - To do this, we get rid of the .pickerType modifier.
  - Change the for each to loop over 0 to 100 instead of the tipPercentageOptions array.

```swift
Picker("Tip Percentage", selection: $tipPercentage) {
    ForEach(0..<101) {
        Text($0, format: .percent)
    }
}
```

### Bonus challenge

- Create a variable to save the currency code instead of typing it out every time
  - We create a constant of type `FloatingPointFormatStyle<Double>.Currency` that returns the currency code.
  - return value is `.currency(code: Locale.current.currencyCode ?? "USD)`
  - we can then use this variable in every place we need the currency code.

```swift
let currencyCode: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
