import Cocoa

// 1. Create a string of arrays
let carCompanies = ["Porsche", "Ferrari", "BMW", "Mercedes", "Aston Martin", "bmw", "Porsche"]

// 2. print number of elements in the array
print(carCompanies.count)

// 3. print the number of unique elements in the array
// here Porsche and BMW are repeated. But as BMW has different cases, it will count as unique.
let uniqueCompaniesArray = Set(carCompanies)
print(uniqueCompaniesArray.count)
