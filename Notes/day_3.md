# [Day 3](https://www.hackingwithswift.com/100/swiftui/3)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
29th June, 2022

### Overview:
- Arrays in Swift
- Dictionaries
- How to use sets for fast data lookup?
- Enums in Swift
- Summary

### Arrays in Swift
- It is very useful to have similar kinds of data altogether in one place.
- Swift has dynamic arrays. That is the array doesn't have a fixed size unlike some programming languages such as c++.
    - Of course if you make it a constant then changing or adding elements is not an option.
- Indexing starts from 0. That is the first element of an array is at the 0th position.
- An empty array of `X` data type can be initialised as such: `var arrayName = Array<X>()`
    - Example: `var fruits = Array<String>()` creates an array named `fruits` that can only hold `String` values.
- Use `.append(element)` to append element to an array.
- As arrays are a very common method of storing similar kind of data together, there is a shorter way of declaring an array of type `X`.
- This can be done as `var arrayName = [X]()`. Thus, `Array<X>` is equivalent to `[X]`.

Some useful methods for Arrays:
- `count()` -> gives you the count of elements in the array
- `contains(element)` -> takes element to look for in the array. Returns boolean depending on if the element is present in the array.
- `sorted()` -> sorts the array in ascending order
- `reversed()` -> A tricky method
    - Doesn't exactly reverse the array.
    - It remembers that it is a reversed collection by forming a new object.
    - Keeps the original array intact inside.
    - When you ask for items, it will at that point do the reversing. It is an optimization.

### Dictionaries
- Retrieving values from an array just on the basis of their index can be difficult in certain cases.
- Dictionaries save data as a **key-value pair**.
- Sometimes, you may request value of a key that may not even be in the dictionary.
- Thus Swift reminds us that we may get a value or we may not.
- Thus an *optional value* is received. (more to be learned about optionals later)
- For now, we can have a default value that is returned to us in case a certain key isn't present in the dictionary.

```swift
let saurabh = [
    "loves": "Porsche",
    "wants": "A 1980 Porsche 911",
    "ready to": "Work for it"
]

// We assign a default value that we want if nothing is present in the dictionary
print(saurabh["loves", default: "Cars"])
```

### How to use sets for fast data lookup?
- Sets work similar to arrays. Although unlike arrays, they do not remember the order the elements were added in and they don't allow duplicates.
- Use `insert` instead of `append` to add elements to a set.
- Sets store their data in a highly optimised order which makes looking for data significantly easier than an array. The effect is more prominent when the data is huge.

### Enums (Enumerations) in Swift
- Set of named values we can create and use.
- Consider the example,
```swift
var colour = "Red"
// changing it to blue
colour = "Blue"
// what if down the line you accidentally changed it to Rain or something that isn't a colour?
colour = "rain"
// or maybe add an unnecessary white space
colour = "black  "
```

- To counter such problems, we can make colours an enum

```swift
enum Colours {
    case red
    case blue
    case black
    case white
}

var colour = Colours.red
colour = Colours.white

// Swift will not let us write something like 
colour = Colours.rain
```
- As a bonus, auto complete will help you even more by suggesting you your options.
- If there are a lot of cases, you can also just write case once and use commas to seperate the entities.
- Enums are also faster for swift to work with.

### Summary
Day 3 was an important one. Learned about methods of grouping data using arrays, dictionaries, sets and enums. Arrays store data of one type and use indexing from 0. Dictionaries use a key-value pair and return an optional. Use defualts for dictionaries. Sets don't remember the order of data and don't store duplicates. But they can give extremely fast lookup. Enums let us create a set of named values that we can use in our code. Enums are also exceptionally fast for swift.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋