# [Day 8](https://www.hackingwithswift.com/100/swiftui/8)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
4th July, 2022

### Default value for parameters
- Sometimes you may want to provide a default parameter value that doesn't have to be passed every time.
- A value the function just assumes to be defualt when no parameter is passed.
- But we also want to keep the possibility open of passing a user parameter, so it cannot just be a constant inside the function body.

```swift
func printTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(number) * \(i) = \(number * i)")
    }
}

// 12 is the default value for the end parameter
// thus when only number is passed, end assumes the value 20
printTable(for: 8)
// If we want to pass a different value, we can also do so
printTable(for: 9, end: 20)
```

### Error handling in functions
- There can be a bunch of things that can go wrong. A good app will take these into consideration using error handling.
- For example, during a networking call the user might lose internet connection.
- Steps in error handling
    1. Define the problems that can occur inside the function.
    2. Define an enum with the errors
    3. Define the function that throws the error.
- Use the `throws` keyword before the return arrow.
- check for the error and if caugh throw the respective error. Else continue with the rest of the function.
- Check password example code from the article

```swift
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}
```

- for handling the error or when calling a function that might throw an error use a `do - catch` block

```swift
// from the above example. Code from 100DaysOfSwiftUI Day 8 article.
do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}
```

- `try` keyword has to be used before all error throwing functions.
- You can have catch blocks for specific errors to and a catch all block for the non sepcific errors.

### Checkpoint 4
- Write a program to find the square root of a number without using the `sqrt()` function.
- Give an out of bounds error if the number is < 1 or > 10,000
- Throw a no root error for numbers without a integer square root.

```swift
import Cocoa

// define enum that has our errors
enum SqrtError: Error {
  case outOfBound
  case noRoot
}

func getRoot(for number: Int) throws -> Int {
  if number < 1 || number > 10_000 { throw SqrtError.outOfBound }
  
  // basic binary search to find root
  var start = 1
  var end = number
  while start <= end {
    let mid = start + (end - start) / 2
    
    if mid * mid == number {
      return mid
    } else if mid * mid < number {
      start = mid + 1
    } else {
      end = mid - 1
    }
  }
  
  throw SqrtError.noRoot
}

do {

  let num = 100_000
  let root = try getRoot(for: num)
  print(root)

} catch SqrtError.noRoot {
  
  print("Given integer has no square root")

} catch SqrtError.outOfBound {
  
  print("Out of bounds")

} catch {
  
  print("Some error occured")

}
```

### Summary
- Learned about default parameter values for functions in Swift
- Understood the importance of error handling and the steps involved.
- Had the checkpoint 4. Code can be found above.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋