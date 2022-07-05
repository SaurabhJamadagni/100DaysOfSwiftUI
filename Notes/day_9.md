# [Day 9](https://www.hackingwithswift.com/100/swiftui/9)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
5th July, 2022

### Closures
- An anonymous function that we can pass around and which does not have an associated function name is known as a closure.
```swift
let sayHello = {
    print("Basic closures")
}
// sayHello constant is callable as a function
sayHello()
```
- We can also pass parameters in closures. They go **inside the braces** of the closure followed by the keyword `in`.
```swift
let sayHello = { (user: String) -> String in
    return "Hello \(user)"
}
```
- The keyword `in` marks the start of the body of the closure.
- Why would one ever use closures?
    - Closures are used extensively.
    - They allow us to write a function inline without having to write a new function again and again. 
- Closures don't use external parameter names.

### Shorthand in closures
- When a parameter has to be passed to a closure, it will not carry out the function without its presence.
- It can also infer the type of the parameter when it is passed. Thus, we do not need to specify the data type of the parameter or the return value.
- When a closure is the trailing parameter for another function, we can also use the trailing closure shorthand. We can get rid of the parenthesis of the function and just write the closure like a start of a condition.
- Also closures provide parameter names using `$0`, `$1` and so on. So we can get rid of the parameter names too.

```swift
let sorted =  team.sorted(by: { (a: String, b: String) -> Bool in
    if a == "X" {
        return true
    } else if b == "Y" {
        return false
    }

    return a < b
})

// after shorthand the above closure becomes with the parameter names
// a and b can also be replaced with $0 and $1 respectively.
let sorted =  team.sorted { a, b in
    if a == "X" {
        return true
    } else if b == "Y" {
        return false
    }

    return a < b
})
```

### Functions that accept functions as parameters
- Remember how we would type annotate a function?
- For example if there is a function `sayHello` that doesn't take any argument and returns `Void`, to make a copy of it we would type annotate the function as such

```swift
func sayHello() {
    print("hello")
}

let sayHelloCopy: () -> Void = sayHello

// sayHelloCopy becomes callable
sayHelloCopy()
```

- When passing a function as a parameter, we will declare it just like another variable in the function declaration but using such type annotation. Example,

```swift
func favCar() {
    print("Porsche 911")
}

func hobbies() {
    print("Driving, reading, painting")
}

func describeSaurabh(aboutCars: () -> Void, interests: () -> Void) {
    print("His favourite car")
    aboutCars()
    print("In his free time, he likes")
    interests()
}

// calling our function and passing functions as argument
// Don't use () when passing parameter.
describeSaurabh(aboutCars: favCar, interests: hobbies)
```
- For your brain to itch further, we can have multiple trailing closures! And it is not that uncommon!

### Checkpoint 5
- take the input `let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]`
- filter out any even numbers
- sort in ascending order
- map each remaining number to a string so that it says "7 is a lucky number" and so on
- print each on a new line.
- Not allowed to use temporary variables.

```swift
// filter, sort, map without temporary variables
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

var finalArray = luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted { $0 < $1 }.map { String($0) }

for num in finalArray {
  print("\(num) is a lucky number")
}
```

### Summary
- Learned about closures. They are anonymous functions that are extensively used.
- Understood different shorthand ways of writing closures, especially the trailing closures shorthand.
- Had checkpoint 5.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋