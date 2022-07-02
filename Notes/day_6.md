# [Day 6](https://www.hackingwithswift.com/100/swiftui/6)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
2nd July, 2022

### Overview
- For loops
- While loops
- Break and Continue
- Checkpoint 3

### For loops
- Extremely useful when some piece of code has to be executed mulitple times.
- The loops do the repetitive work for us.
```swift
let platforms = ["iOS", "macOS", "tvOS"]
for os in platforms {
    // os is the loop variable
    // loop variable is only for the loop body
    // loop body
    print("Swift for \(os)")
}
```

- We can loop over a fixed range of numbers using `...` opearator. It is known as the range operator
- `1...12` implies a range 1 to 12 inclusive.
- `1..<12` will exclude the upper boundary.
- Use an `_` for a loop variable that is not being used in the loop body.

### while loop
- A while loop doesn't loop over something.
- It executes the loop body, until the provided condition is true.
- Thus, we need some count of condition counter in the loop body or the loop will run endlessly.

(Introduced to `Int.random(in: )` function that lets us generate random integers.)

### How to skip loop items with break and continue
- We can skip one iteration of a loop using `continue` or exit the loop entirely using `break`.

### Checkpoint 3
- The classic "FizzBuzz" problem.
- We have to loop over 1 to 100.
- If the number is a multiple of 3, print "Fizz"
- If the number is a multiple of 5, print "Buzz"
- If it is a mulitple of both 3 & 5, print "FizzBuzz". Else print the number itself.

Code:
```swift
for i in 1...100 {
  if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
    print("FizzBuzz")
  } else if i.isMultiple(of: 3) {
    print("Fizz")
  } else if i.isMultiple(of: 5){
    print("Buzz")
  } else {
    print(i)
  }
}
```

### Summary
- Learned about loops and exiting loops.
- For loops are used for a finite known range.
- While loops can be used when we don't know the range but have to execute the loop until a certain condition is true.
- `break` can be used to exit the loop completely. `continue` can be used to skip a single iteration of the loop.
- Had Checkpoint 3. Code can be found above.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋