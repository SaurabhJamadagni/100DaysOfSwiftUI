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

### Challenge - 3

- Create a custom modifier that makes a view have a large blue font like a prominent title

```swift
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.blue)
            .shadow(radius: 5)
    }
}

extension View {
    func stylizeTitle() -> some View {
        modifier(Title())
    }
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
