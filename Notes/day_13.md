# [Day 13](https://www.hackingwithswift.com/100/swiftui/13)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
9th July, 2022

### Protocols
> Protocols are a bit like contracts in Swift: they let us define what kinds of functionality we expect a data type to support, and Swift ensures that the rest of our code follows those rules.
- Functions inside a protocol have no function bodies.
- Any class that adopts a certain protocol must write function bodies inside the class for the functions declared in the protocol.
- Functions inside the struct adopted from the protocol must have the same names, parameters and return types. 
- Inside the struct, these are actual methods and not just declarations.
- This can be used when you have to pass a parameter that can be of a different struct, but you need to make sure that the required method is present in all. 
- Protocols will make sure that the method you wish to call is present in the conforming struct.
- We can conform to as many protocols as we want by seperating them with a comma.

```swift
protocol Protocol {
    func doThis(with this: String) -> Bool
    func doThat(with that: Int)
}

struct A: Protocol {
    // this struct conforms to our created protoocol
    // must implement the methods doThis() and doThat()

    func doThis(with this: String) -> {
        print("executing")
        return true
    }

    func doThat(with that: Int) {
        print("Did that already")
    }
}
```

### Opaque return types
- Opaque return types allow us to hide information in our code but not from the swift compiler.
- How do you return a protocol then?
- We can do so by using the keyword `some` followed by the protocol instead of the return type.

```swift
func function() -> some Protocol {
    
}
```

- Here swift exactly knows what is the data type that is actually going back. But that information is hidden from us.
- Where can we see the use of opaque return types?
    - Swift has a protocol called View. It is basically anything that needs to be shown on the screen.
    - But images, buttons, everything is part of a view. 
    - Thus when returning this, we can say that we are returning `some View`.


### Extensions
- Extensions let us add more functionality to a data type, even the ones provided by Apple!
- Done using the keyword `extension`
- Extensions help us with code completion, organization. Extensions provide full internal access to the members of the data type. For example, if some property is made private, making a function a part of the extension will give us access to those.

> Pro tip: If a method ends in '-ed' like `sorted` then it probably returns something. Whereas if it doesn't have a suffix like `sort` then it will carry out the operation in-place.

### Extending Protocols
- In protocol extensions, we can have additional computed properties as well as defualt implementations to the functions declared in the protocol.

### Checkpoint 8
- Create a protocol describing a building.
- Inside the protocol have,
    - number of rooms the building has
    - property storing the cost as an integer
    - string property storing the name of the real estate agent
    - method to print the sales summary
- Create two structs, house and office that adopt this protocol

```swift
import Cocoa

protocol Building {
  var numOfRooms: Int { get }
  var cost: Int { get }
  var agentName: String { get set }
  
  func printSalesSummary()
}

struct House: Building {
  var numOfRooms: Int
  var cost: Int
  var agentName: String
  
  func printSalesSummary() {
    print("This house has \(numOfRooms) rooms")
    print("It costs $\(cost)")
    print("The current RealEstate agent is \(agentName)")
  }
}

struct Office: Building {
  var numOfRooms: Int
  var cost: Int
  var agentName: String
  var isOnLease: Bool
  
  func printSalesSummary() {
    print("This office has \(numOfRooms) rooms")
    print("It costs $\(cost)")
    print("The current RealEstate agent is \(agentName)")
    if !isOnLease {
      print("currently available for lease")
    }
  }
}

var house = House(numOfRooms: 4, cost: 400_000, agentName: "Scrooge McDuck")
house.printSalesSummary()

var office = Office(numOfRooms: 30, cost: 12_000_000, agentName: "Money Forall", isOnLease: false)
office.printSalesSummary()
office.numOfRooms = 50
office.printSalesSummary()
```

### Summary
- Learned about using and creating protocols. Protocols are like a contract that mention the necessary properties and methods for a struct that may be conforming to a protocol.
- Opaque return types allow us to hide information but not from the swift compiler.
- Extensions allow us to extend the functionality of a struct or assign default method implementations for protocol functions.
- Had checkpoint 8.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋