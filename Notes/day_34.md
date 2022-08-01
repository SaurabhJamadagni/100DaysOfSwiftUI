# [Day 34](https://www.hackingwithswift.com/100/swiftui/34)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
30th July, 2022

- Challenge and review day for Technical project on animations.

### Challenge - 1

- Animate the correct answer flag in GuessTheFlags so that it spins around the y axis.
  - We add 2 variables, one to assign the correct flag to spin and the other for holding the degrees to spin.
  - inside the .rotation3DEffect, we use a ternary operator to make sure only the correct answer flag spings.

```swift
// Animation variables
@State private var flagToSping = 0
@State private var spinningDegrees = 0.0

// Modifier added to the flag button inside the ForEach
// We only want the flag to spin when the correct answer is chosen. That is why we use ternary operators.
.rotation3DEffect(.degrees(flagToSping == number ? spinningDegrees : 0), axis: (x: 0, y: 1, z: 0))

// inside the checkAnswer function, we assign the variables
// Use withAnimation to observe the animation
withAnimation {
    flagToSping = number
    spinningDegrees = 360
}
```
