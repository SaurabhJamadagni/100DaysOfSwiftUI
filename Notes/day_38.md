# [Day 38](https://www.hackingwithswift.com/100/swiftui/38)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
3rd August, 2022

- Challenge and review day for project 7 - iExpense

### Challenge - 1

- Use the user’s preferred currency, rather than always using US dollars
  - Use `Locale.current.currencyCode ?? "USD"`

### Challenge - 2

- Add different colours to the amount based on the amount range. Ranges being (0, 10), (11, 100), (101, ...)
  - Created a function that returns a Color view based on the range.
  - Add a frame with background colour and padding to mag it look like a tag.

```swift
// The function that returns the required color in the background modifier
func colorizeAmountConditionally(_ amount: Double) -> Color {
    switch amount {
    case 0...10:
        return Color(red: 181 / 255, green: 234 / 255, blue: 215 / 255)
    case 11...100:
        return Color(red: 226 / 255, green: 240 / 255, blue: 203 / 255)
    case 101...:
        return Color(red: 255 / 255, green: 154 / 255, blue: 162 / 255)
    default:
        return Color(red: 255 / 255, green: 154 / 255, blue: 162 / 255)
    }
}

// Modifiers to the Text view in ContentView
Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
    .frame(alignment: .center)
    .padding(5)
    .background(colorizeAmountConditionally(item.amount))
    .clipShape(RoundedRectangle(cornerRadius: 5))
```

### Challenge - 3

- try splitting the expenses list into two sections: one for personal expenses, and one for business expenses
