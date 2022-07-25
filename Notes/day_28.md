# [Day 28](https://www.hackingwithswift.com/100/swiftui/28)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
24th July, 2022

- Challenges day for project 4 - BetterRest

### Challenge - 1

- Replace VStack with sections

### Challenge - 2

- Convert the stepper to choose cups of coffee to a Picker for the same range

```swift
Picker("Daily coffee intake", selection: $coffeeAmount) {
    ForEach(1..<21) {
        Text($0 == 1 ? "\($0) cup" : "\($0) cups")
    }
}
.font(.headline)
```

### Challenge - 3

- Show the bedtime always, getting rid of the calculate button.
  - Create a computed property that does what the calculate function does.
  - Add a section to show this property and format that text view to have `.largeTitle`.
  - Show the alert only if a error is thrown.
  - Get rid of the toolbar and calculate button.

```swift
// 1. computed property
var bedTime: String {
    do {
        let config = MLModelConfiguration()
        let model = try SleepCalculator(configuration: config)

        let wakeUpComponents = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hours = (wakeUpComponents.hour ?? 0) * 3600 // converting to seconds
        let minutes = (wakeUpComponents.minute ?? 0) * 60

        let prediction = try model.prediction(wake: Double(hours + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
        let sleepTime = wakeUp - prediction.actualSleep

        return sleepTime.formatted(date: .omitted, time: .shortened)

//            alertTitle = "Your ideal bedtime is…"
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)

    } catch {
        alertTitle = "Error!"
        alertMessage = "Sorry, your bedtime couldn't be calculated."
        showingAlert = true
    }
    return "WIP"
}

// 2. creating a new section to show the property. Goes at the end.
Section {
    Text(bedTime)
        .font(.largeTitle)
        .foregroundColor(.green)
} header: {
    Text("You should go to bed by")
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
