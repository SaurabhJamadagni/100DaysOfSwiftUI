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
