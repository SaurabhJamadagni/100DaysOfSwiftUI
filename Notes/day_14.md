# [Day 14](https://www.hackingwithswift.com/100/swiftui/14)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
10th July, 2022

### Optionals
- Optionals imply that a requested value may or may not exist.
- Optionals are represented by using a `?` after the data type. Example, `String?` is a Optional String.
- Swift likes data to be predictable. Thus to use optionals, we have to unwrap it first to make sure it has some form of data present in it.
- One of the ways of unwrapping an optional is to use `if let`.
```swift
if let valueInside = optional {
    // do whatever you want with the valueInside.
}
```
- The unwrapped constant can have the variable name itself. It is allowed and known as shadowing.
- A nil variable implies the absence on data. For example a integer variable assigned with value 0 is still some data. Whereas a nil integer variable has no data at all.

### Unwrapping optionals with guard
- guard let will run the code inside the parenthesis if the optional has value nil.
```swift
guard let number = number else {
    // execute code that should run if number is nil
    return
}
// code for when number has some form of data.
```
- Swift requires you to return if a guard check fails.

### Nil coalescing
- We basically provide a defualt value if the optional has nil inside.
- `??` is the nil coalescing operator.
- Example, 
```swift
let car: String? = nil
let facCar = car ?? "Porsche 911"
```

### Optional chaining
- Optional chaining allows us to run some code on an optional if it has a value.
- Basically the next methods are chained using the optional using the dot operator.
- If something returns an optional, it is followed by a `?` in the chain.
- If any of the optionals return nil in the chain, nil is returned instantly.

### Handling function failures using optionals
- If we care only care about if a function failed or succeeded, we can use `try?` when calling it. 
- If the function returns a value, that will be returned as an optional now.
- But if it fails, we will be returned nil. But we can't know the cause of the failure.

### Checkpoint 9
- write a function that takes an optional integer array and spits out a random int from the array. 
- If the array is empty, then it has to return a random number in the range 1...100
- The entire code needs to be in one line!

```swift
func getRandomElement(numbers: [Int]?) -> Int {
  numbers?.randomElement() ?? Int.random(in: 1...100)
}

print(getRandomElement(numbers: [5, 7, 1, 2]))
print(getRandomElement(numbers: nil))

// OUTPUT -------------
// 5
// 18
```

### Summary
- Optionals may or may not contain actual data. They can hold nil.
- They need to be unwrapped before being used.
- Ways to unwrap are if-let, guard-let-else, nil coalescing. We can also chain optionals.
- Had checkpoint 9.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋