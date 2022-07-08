# [Day 12](https://www.hackingwithswift.com/100/swiftui/12)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
8th July, 2022

### Classes
- There is one more way other than structs to create a custom type of data.
- Swift **won't** generate a memberwise initialiser for classes.
- You can inherit properties and methods in classes through *inheritance*
- Class instances are copied by reference. A change in the copy will make a change in the original too.
- Even if you declare a class instance to be constant, we can go ahead and change properties inside it as long as they are declared to be variables.
- When all copies of a class instance are deleted, we can call the deinitialiser to get rid of the data which has no references pointing to it to cleanup.

### Implementing class inheritance
- The class from which you inherit from is known as the `super` or the parent class.
- The class that inherits from the super class is known as the `sub class` or the child class.

```swift
class SubClass: SuperClass {
    // class body
}
```

- If you want to override a method in a child class that was inherited from the parent class, we can use the keyword `override` before `func`.

```swift
class SuperClass {
    func display() {
        print("ahhoy!")
    }
}

class SubClass: SuperClass {
    override func display() {
        print("I took control now")
    }
}
```

- If you don't want another class to inherit from one class, we can use the keyword `final`. This way that class becomes the final class and no other class can inherit from it.

### Class initialisers
- Swift will never provide a initialiser for classes.
- We have to either create a custom init or assign default values for all properties.
- A child call should call the initaliser of its super class after assigning its properties.
- This is done by calling `super.init()`

### How to copy classes
- Classes are reference types in Swift.
- So how to copy without affecting the original?
- We have to make a **deep copy** for it. This includes creating a copy function in the class that assigns all properties to the properties of the copy and returns the copy.

### Deinitialisers in Swift
- Just like initialisers, we do not use the word `func` at the start.
- They never take parameters or return anything. They don't even have the `()` 
- They are automatically called when the last copy of the class instance is destroyed.
- Create a deinitializer using the keyword `deinit`.

```swift
class A {
    deinit {
        print("Calling the destroyer")
    }
}
```

### How to work with variables inside class instances
- This can be done by making the instance variable too. By doing this, we can point to a whole other instance variable.

### Checkpoint 7
- Create an animal, dog, cat, corgi, poodle, lion, persian class
- Dog inherits from animal and corgi and poodle inherit from dog.
- Cat inherits from animal and persian and lion inherit from cat
- All should have a method speak which is different for each animal
- have a isTame property for cats and have correct initialisers.

```swift
class Animal {
  let legs: Int
  
  init(legs: Int) {
    self.legs = legs
  }
}

class Dog: Animal {
  func speak() {
    print("I am a dog, woof woof!")
  }
}

class Corgi: Dog {
  override func speak() {
    print("I am a corgi, woof woof!")
  }
}

class Poodle: Dog {
  override func speak() {
    print("I am a poodle, woof woof!")
  }
}

class Cat: Animal {
  var isTame: Bool
  
  init(isTame: Bool, legs: Int) {
    self.isTame = isTame
    super.init(legs: legs)
  }
  
  func speak() {
    print("I am a cat")
  }
}

class Persian: Cat {
  override func speak() {
    print("I am a cat and I purr")
  }
}

class Lion: Cat {
  override func speak() {
    print("I am a cat and I roar")
  }
}

let dog = Dog(legs: 4)
dog.speak()
let corgi = Corgi(legs: 4)
corgi.speak()
let poodle = Poodle(legs: 4)
poodle.speak()

let cat = Cat(isTame: true, legs: 4)
cat.speak()
let persian = Persian(isTame: true, legs: 4)
persian.speak()
let lion = Lion(isTame: false, legs: 4)
lion.speak()
print("Is a lion tameable? \(lion.isTame)")


// OUTPUT
// I am a dog, woof woof!
// I am a corgi, woof woof!
// I am a poodle, woof woof!
// I am a cat
// I am a cat and I purr
// I am a cat and I roar
// Is a lion tameable? false
```

### Summary
- Classes are similar to structs but they are reference type. We can also inherit in classes.
- Classes can't generate a memberwise initializer.
- We can create a deinitializer for classes that destroys the value when all the copies of a class instance are deleted.
- Had checkpoint 7.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋