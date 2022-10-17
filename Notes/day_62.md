# [Day 62](https://www.hackingwithswift.com/100/swiftui/62)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
17th October, 2022

- Start of project Instafilter! Two key takeaways are going to be how to use Apple's Core Image framework and how to integrate SwiftUI with UIKit.

### Property wrappers and their struct conundrum
- Basically, each property wrapper has a struct behing it.
- Press `cmd + shift + O > State`.
- Each wrapper wraps around a certain value and it gets a `{ get nonumutating set }`.
- This implies when you change the value of a binding, it is calling a nonmutating set. Thus the didset on a `@State` property will never be triggered. 
- Whereas if you assign a completely new value, which results in the destruction of the previous struct and sets a new struct for the lack of a better description, the didset will be triggered.
- So how do you figure out when a binding value changes internally?

### The onChange modifier
- The `onChange` modifier can be used to figure if a property changes through the nonmutating set property.

```swift
.onChange(of: blurAmount) { newValue in
    print("New value is \(newValue)")
}
```

### Multiple options with confirmationDialog
- Are different from alerts but are shown in a similar fashion. Bind to a boolean which triggers the confirmation.
- use `confirmationDialog` instead of alert and the rest is very very similar.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋