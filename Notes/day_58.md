# [Day 58](https://www.hackingwithswift.com/100/swiftui/58)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
11th October, 2022

### NSPredicate
- Predicates are like tests for objects in the entity.
- The object will only be shown if it passes the tests.
- Basically, it's like a SQL query.
- Use NSPredicate(format: "query inside")
- But if the query has quotation marks then it can get tricky.
- Thus use %@ as placeholder.

```swift
NSPredicate(format: "universe == %@", "Star Wars"))
```
- We can also make use of operations such as IN, BEGINSWITH and NOT. Also, for more complex predicates, use AND.

Tip: Look at NSCompoundPredicate for complex predicates.

### Dynamically filtering FetchRequest
- Create a new SwiftUI view. Let's say it's FilterList
- Give it a fetch request property.

```swift
@FetchRequest var fetchRequest: FetchedResults<Singer>
```
- Add an initializer similar to the below.

```swift
init(filter: String) {
    _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
}
```
- Notice the underscore before fetchrequest.
- When we update a state value, it means now use this value for the state struct.
- Giving the underscore means use a new state struct entirely.
  
> Note: To learn how to create a FilterList view that works for any entities, i.e. using generics, come back to this day and look into the 'Want to go further' section.

### One-to-Many relationships
- How to establish relationships between entities?
- In the CoreData editor, under Attributes there will be Relationships. You can also choose between 'To One' or 'To Many' depending on the type of relation in the inspector.
- Select both entities > Codegen > Manual/None. Editor > Create NSManagedObject Subclass.
- NSSet is not similar to a SwiftUI Set. So try to use an `as` operator else nil coalesce it.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋