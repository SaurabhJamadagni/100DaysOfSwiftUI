import Cocoa

// define enum that has our errors
enum SqrtError: Error {
  case outOfBound
  case noRoot
}

func getRoot(for number: Int) throws -> Int {
  if number < 1 || number > 10_000 { throw SqrtError.outOfBound }
  
  var start = 1
  var end = number
  while start <= end {
    let mid = start + (end - start) / 2
    
    if mid * mid == number {
      return mid
    } else if mid * mid < number {
      start = mid + 1
    } else {
      end = mid - 1
    }
  }
  
  throw SqrtError.noRoot
}

do {
  let num = 100_000
  let root = try getRoot(for: num)
  print(root)
} catch SqrtError.noRoot {
  print("Given integer has no square root")
} catch SqrtError.outOfBound {
  print("Out of bounds")
} catch {
  print("Some error occured")
}
