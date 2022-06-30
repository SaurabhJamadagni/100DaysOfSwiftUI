# [Day 4](https://www.hackingwithswift.com/100/swiftui/4)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
30th June, 2022

### Type Annotations
- Sometimes we may want to override the type of a variable or postpone the decision of what data type a variable should be.
- This is where type annotations come into play.

Consider the example,
```swift
let name = "Saurabh"
```
- Here Swift infers that `name` must be a String type as a String value is assigned.
- Type annotations are given as follows in swift,
```swift
let name: String = "Saurabh"

let digit: Double = 0
// here even if we are not giving a decimal point, 
// we are overriding swifts inference by stating that digit is a double
```

Some of the ways to declare a String Array which are all valid are:
```swift
var fruits: String = ["mango", "orange", "papaya"]
var cars: String = [String]()
var flowers: String = []
var dips = [String]()
```

#### Type Annotations with constants
- Swift will let us declare a constant that is uninitialised.
- We can later assign a value.
- But here type annotations are important because without a value or a type either swift has nothing to work with for that constant.
- After the constant is later assigned a value, it will behave as a constant. That is, its value can not be changed after the first assignment.

```swift
let car: String
// we can assign a value to a constant now because it isn't initalised
// has to be a string as it is type annotated
car = "Porsche 911"
```

### Checkpoint 2
- Write code to create an array of strings, print the number of elements in the array and also print the number of unique elements in the array.

```swift
// 1. Create a string of arrays
let carCompanies = ["Porsche", "Ferrari", "BMW", "Mercedes", "Aston Martin", "bmw", "Porsche"]

// 2. print number of elements in the array
print(carCompanies.count)

// 3. print the number of unique elements in the array
// here Porsche and BMW are repeated. But as BMW has different cases, it will count as unique.
let uniqueCompaniesArray = Set(carCompanies)
print(uniqueCompaniesArray.count)

// will output
// 7
// 6
```

### Summary
Day 4 was a short one. Learned about type annotations in Swift. Type annotations can help us override swift type inference or postpone declaring value for a constant. Had the second checkpoint. 

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋