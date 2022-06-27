# Day 1
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
27th June, 2022

> Programming is an art: don't spend all your time sharpening your pencil when you should be drawing.

- SwiftUI is framework used to build apps for the myriad of apple devices based on the Swift language.

### Why Swift?
- Swift is a fairly young language launched in 2014.
- This allows the language to take advantage and builds upon the successes of other languages.
- Swift makes it
	- difficult to write unsafe code.
	- easy to write code with clarity
	- possible to work with all other languages.
- It is also a very powerful language!

### How to follow along?
- You will require [Xcode](https://apps.apple.com/in/app/xcode/id497799835?mt=12) 13 or later which can be downloaded on the app store for free.
- Playgrounds is a great place to experiment and practise concepts of swift.

### Creating Variables and Constants
- There are two ways to store data in swift
- Create a variable when you want to change the data later or know that the data will change down the line. 
- To create a variable the `var` keyword is used using the syntax `var variableName = value`
- Creating a constant is similar to creating a variable. Use the `let` keyword instead of `var`.
- **Prefer using constants**. It will help you avoid changing variables on accident which should not have been changed.
```swift
var mood = "Happy"
// variables can be reassigned
mood = "excited"

// constants cannot be reassigned
let pain = "constant"
```

### Working with Strings

- Strings in swift are followed by double quotes.
- They can contain special characters, emojis along with normal text. Use the `\` escape operator wherever necessary.
- Multi-line strings use triple quotes.

```swift
// Multi-line strings
let fact = """
Exercising is
good for
YOU!
"""
```

- Some of the special properties and methods that strings in swift have are
	- `count` -> tells you the number of characters in a string
	- `uppercased()` -> makes all the characters in the string uppercase.
	- `hasPrefix(prefix)` -> takes the prefix as argument. Returns a boolean
	- `hasSuffix(suffix)` -> takes the suffix as argument. Returns a boolean

- This is very basic information about strings. Strings will be further explored more down the road.


### Working with Integers
- Use underscore `_` to make large numbers readable. Example, `10_000_000`
- Use shorthand operators to avoid redundant variables.
```swift
// multiplication shorthand operator used to multiply variable by 100 and store the result in itself.
var confidence = 100_000
confidence *= 100
```
- Integers also have some special properties and functions that are very powerful and useful.
	- One of which is `isMultiple(of: num)` -> checks if the given number is a multiple of `num`. Returns a boolean.

### Working with Decimals
- Decimals are not as accurate as Integers because of the floating point.
- This is because the data is stored in binary. Some numbers are not possible to be stored in binary due to their recurring nature. Example `1/3 = 0.333333333...`
- You will also see one more data type thrown around known as `CGFloat`. It is part of CoreGraphics and can be interchangably used with `Double`
- Decimals are a completely different data type than integers. You cannot carry operations across data types. Some form of conversion has to be made. 

### Summary
Swift is a powerful programming language that is used to work with SwiftUI. On day 1, concepts such as variables and constants, working with integers, strings and doubles were discussed. Create a variable when you want to change the data or the data will change due to some operation. Else prefer constants. Integers and variables are handled differently. Also learned about Strings & multi-line strings.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋