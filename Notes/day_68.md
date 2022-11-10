# [Day 68](https://www.hackingwithswift.com/100/swiftui/68)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
10th November, 2022

### Operator overloading
- We can't just use sorted() on an array of elements that are instances of a struct we made.
- This is because there is no way for swift to understand how the comparison should take place.
- The solution to this is that use the Comparable protocol and overload the < operator.
- The function has to return a boolean so there is no chance for the values to be equal.
- The function also has to be static so that it is a function on the actual struct than any particular instance.

```swift
struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String

    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}
```

### Saving data to document directory locally
- Apple will allow us to save data to a directory on the device that is created for every app.
- This directory is also icloud backed so changing devices for the user can also restore data.
- But apps are sandboxed and there is no way of finding out what the name of the directory is. The only option that remains is guessing it and that's simply stupid!
- We thus make use of Apple's APIs. We will use a new class called FileManager.
- Consider the following helper method.

```swift
func getDocumentsDirectory() -> URL {
    // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    // just send back the first one, which ought to be the only one
    return paths[0]
}
```

- The write(to:) method
  - A URL to write to.
  - Whether to make the write atomic.
  - What character encoding to use.
  
> Tip: Enums are a great way to create states that trigger different View changes.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
