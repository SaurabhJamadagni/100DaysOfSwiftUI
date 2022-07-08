# [Day 11](https://www.hackingwithswift.com/100/swiftui/11)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
7th July, 2022

### Restricting access to properties and methods in Structs
- Sometimes you just don't want the properties to be able to be tampered openly. Thus access to them needs to be restricted.
    - For example, funds in a bank account struct shouldn't be able to be modified by just anyone.
- The keyword `private` restricts the access to a property to the methods inside the struct only. No other external methods can access a private property.
- Following are some of the access modifiers in swift
    1. `private` -> for access within the struct
    2. `fileprivate` -> for access within the file
    3. `public` -> for anyone, anywhere
    4. `private(set)` -> This allows anyone to read the properties, but only the internal methods can write to it.
- Swift cannot generate a memberwise initialiser on its own if any internal property is private.
- Basically declare a custom init whenever you have private properties.

### Static properties
- Sometimes you may want a property to be for the struct only and not for its instances.
- We cannot access non-static properties from static members. `static ≠> non-static`
- Non-static members can read static members. `non-static => static`
- We can just access the static member using the self keyword. No need to create an instance.

### Checkpoint 6
- Create a car struct that includes model, number of seats and current gear.
- add a method to change gears up or down
- don't allow invalid gears. a range of 1 to 10 is fine.

```swift
import Cocoa

enum ShiftingErrors: Error {
  case invalidDownShift, invalidUpShift, invalidShiftString
}

struct Car {
  let model: String
  let numberOfSeats: Int
  var currentGear: Int = 0 // car in neutral
  
  mutating func shiftGears(shift: String) throws {
    switch shift {
    case "up":
      if currentGear < 10 {
        currentGear += 1
        print("upshifting, current gear is now \(currentGear)")
      } else {
        throw ShiftingErrors.invalidUpShift
      }
    case "down":
      if currentGear > 0 {
        currentGear -= 1
        print("downshifting, current gear is now \(currentGear)")
      } else {
        throw ShiftingErrors.invalidDownShift
      }
    default:
      throw ShiftingErrors.invalidUpShift
    }
  }
}

do {
  
  var porsche = Car(model: "porsche 911", numberOfSeats: 2, currentGear: 5)
  try porsche.shiftGears(shift: "up")
  try porsche.shiftGears(shift: "down")
  try porsche.shiftGears(shift: "down")
  try porsche.shiftGears(shift: "down")
  try porsche.shiftGears(shift: "down")
  try porsche.shiftGears(shift: "down")
  try porsche.shiftGears(shift: "down")
  try porsche.shiftGears(shift: "down")
  
} catch ShiftingErrors.invalidUpShift {
  print("Already at highest gear")
} catch ShiftingErrors.invalidDownShift {
  print("Already at the lowest gear")
} catch {
  print("Wrong input string")
}

// Output -------------------------------
// upshifting, current gear is now 6
// downshifting, current gear is now 5
// downshifting, current gear is now 4
// downshifting, current gear is now 3
// downshifting, current gear is now 2
// downshifting, current gear is now 1
// downshifting, current gear is now 0
// Already at the lowest gear
```

### Summary
- learned about access modifiers in swift. They can restrict who has access to struct members.
- Static members are members of a struct and not any particular instance. They are common to all instances.
- Had Checkpoint 6.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋