import Cocoa

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
