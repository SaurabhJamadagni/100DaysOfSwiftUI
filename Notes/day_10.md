# [Day 10](https://www.hackingwithswift.com/100/swiftui/10)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
6th July, 2022

### Structs
- They allow us to create complex data types with our own variables and functions.

```swift
struct Porsche {
    let model: String
    let year: Int
    let colour: String

    func coldStart() {
        print("* mean engine noises *")
    }
}
```

- We can create instances of a struct,

```swift
let myFavCar = Porsche(model: "Porsche 911", year: 1980, colour: "Gun metal")
print(myFavCar.model)
myFavCar.coldStart()
```

- Whenever you create an instance of a struct, an implicit method `init` is called that creates the instance.
- Swift does not allow to change the values of a property of a struct using a function inside it.
- If you want to change the value, you have to go through an additional step.
- The function has to be marked with the keyword `mutating` to make changes to the variable. Till then it will be treated as a constant and won't accept changes.
- You cannot call a mutating function on a `let` constant variable.

### Computed properties
- Structs have two properties. One is a **stored property**, where we store some value in the property.
- The other type is a **computed property**. These properties are recalculated every time they are accessed.

```swift
var varName: Type {
    // calculation steps
    // return a value of the mentioned type
}
```

- We cannot write to a computed property yet. To do that we have to use a getter and setter.
- Used keywords are `get` and `set`.

```swift
var varName: Type {
    get {
        // what do you return when you want to retrieve this value
        // calculation from before
    }

    set {
        // what do you wish to do when writing to this property
    }
}
```

- `newValue` is something that is provided to us by swift. It can be used to in the setter and is the value that you wish to write to the computed property.

### Property Observers
- These are special pieces of code which run whenever the value of a specific property changes.
- They come in two forms. `didSet` is when the value is changed. `willSet` is when the value is about to be changed.
- Although, don't put too much work inside the property observers.
- Constants don't have property observers as they never change value. (Obviously)

### Custom initialisers
- Created using the keyword `init`. The `func` keyword doesn't need to be used.
- Remember this basic rule of a custom initialiser
> All the properties must be initialised or have some value before init is over

```swift
struct Player {
    var playerName: String
    var number: Int

    init(playerName: String, number: Int) {
        self.playerName = playerName
        self.number = number
    }
}
```

- There will never be an explicit return type for `init`.
- The `self` keyword is a reference stating that you wish to assign the property of the struct you are in.

### Summary
- The principal concept today was Structs.
- Structs allow us to create comple data types with their own functions and variables
- Learned about custom initialisers. 
- Learned about computed properties, getters and setters.
- Saw how to use property observers using `willSet` and `didSet`.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋