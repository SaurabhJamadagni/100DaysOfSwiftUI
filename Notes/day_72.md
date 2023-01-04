# [Day 72](https://www.hackingwithswift.com/100/swiftui/72)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
1st December, 2022

### MVVM Architecture
- It is a software architecture pattern commonly used in SwiftUI.
- It is not just basic organization of code.
- Separation of logic and UI makes it super easy and fast.
- MVVM stands for Model-View-ViewModel
- Here's how you create a ViewModel for a View.

- extend the struct and have the view model class inside it. It should conform to the ObservableObject protocol.
- The main actor is **responsible for running all user interface updates**, and adding that attribute to the class means we want all its code – any time it runs anything, unless we specifically ask otherwise – to run on that main actor.'

> Views work best when they handle presentation of data, meaning that manipulation of data is a great candidate for code to move into a view model.

- To make a property readable only make it `private(set)`.


> As for saving, previously I showed you how to write a string to disk, but the Data version is even better because it lets us do something quite amazing in just one line of code: we can ask iOS to ensure the file is written with encryption so that it can only be read once the user has unlocked their device. This is in addition to requesting atomic writes – iOS does almost all the work for us.

- We can have a strong encryption to a file by adding the .completeFileProtection to the options while writing to the directory.

```swift
try data.write(to: savePath, options: [.atomic, .completeFileProtection])
```

### Unlocking device using biometrics
- Procedure similar to seen previously in this project.
- Note that when you toggle a boolean on authentication to show the view, it does not happen on the main thread.
- Thus you have to create a Task that specifies that this is something that needs to be done by the main actor.

```swift
if success {
    Task { @MainActor in
        self.isUnlocked = true
    }
} else {
    // error
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋