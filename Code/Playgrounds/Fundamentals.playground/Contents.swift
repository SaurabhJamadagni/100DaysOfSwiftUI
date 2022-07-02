import Cocoa

// FizzBuzz
// loop over range of 1...100
// if number is multiple of 3, print Fizz
// if number is multiple of 5, print Buzz
// if number is multiple of 3 & 5, print FizzBuzz

for i in 1...100 {
  if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
    print("FizzBuzz")
  } else if i.isMultiple(of: 3) {
    print("Fizz")
  } else if i.isMultiple(of: 5){
    print("Buzz")
  } else {
    print(i)
  }
}
