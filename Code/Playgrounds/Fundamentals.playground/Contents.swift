import Cocoa

func getRandomElement(numbers: [Int]?) -> Int {
  numbers?.randomElement() ?? Int.random(in: 1...100)
}

print(getRandomElement(numbers: [5, 7, 1, 2]))
print(getRandomElement(numbers: nil))
