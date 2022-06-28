# [Day 2](https://www.hackingwithswift.com/100/swiftui/2)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
28th June, 2022

### Working with Booleans
- Stores either True of False
- When the logic demands a simple true or false answer, booleans come into play.
- Booleans have the not operator. The sign used is `!`. It essentially flips the value from true to false and vice-versa.
- The `.toggle()` method can also flip the value.

### Joining Strings
- We can combine strings in swift using two ways:
    - Using `+`
    - String interpolation

**Using the `+` operator**
- Basically appends the given strings in order to form the resultant string.

```swift
let firstName = "Saurabh"
let lastName = "Jamadagni"
let name = firstName + lastName

// Strings can be added directly
let praise = firstName + " is amazing"
```
- Everytime you use the `+` to join strings, swift makes a new string for the intermediate results.
- Example given in the article is,
```
let luggageCode = "1" + "2" + "3" + "4" + "5"
```
> Swift can’t join all those strings in one go. Instead, it will join the first two to make “12”, then join “12” and “3” to make “123”, then join “123” and “4” to make “1234”, and finally join “1234” and “5” to make “12345” – it makes temporary strings to hold “12”, “123”, and “1234” even though they aren’t ultimately used when the code finishes.
- Thus we can see the inefficiency of this method. 

**String Interpolation**
- It is much more efficient.
- It uses the `\` operator we saw previously.

```swift
let firstName = Saurabh
let praise = "\(firstName) is amazing!!"
```
- We can also put calculations inside string interpolations

```swift
let currentYear = 2022
print("My age is \(currentYear - 2002)")
```

### Checkpoint 1
- Write a program to convert celsius to fahrenheit

```swift
// adding the decimal point makes it a Double
let celsius = 38.0
let fahrenheit = (celsius * 9.0) / 5.0 + 32.0
print("\(fahrenheit)°F")
```

### Summary
Booleans are used when you expect a binary response -- either true or false. Strings can be joined using the `+` operator but a more efficient method is using string interpolation. First checkpoint, wrote code to convert celsius to fahrenheit.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋