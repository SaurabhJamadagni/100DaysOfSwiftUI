import Cocoa

// filter, sort, map without temporary variables
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

var finalArray = luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted { $0 < $1 }.map { String($0) }

for num in finalArray {
  print("\(num) is a lucky number")
}

