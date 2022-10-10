# [Day 57](https://www.hackingwithswift.com/100/swiftui/57)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
9th October, 2022

### How does \\.self work?
- It uses the entire object to identify. But a struct is nothing other than its properties. Then how does it work?
- Basically the struct is hashed and this hashed value is used for identification.
- Generally for a hasing function:
  - No matter the size of the object, the output should be of the same fixed size.
  - When the same object is hashed again, it should result in the same value.
- It’s not possible to convert the hash back into its original value
- When Xcode generates a class for our managed objects, it makes that class conform to Hashable, which is a protocol that means Swift can generate hash values for it, which in turn means we can use `\.self` for the identifier.

### Creating NSManagedObject Subclasses
- Data model creates a class automatically. But, as we have seen it can be annoying to deal with all the optionals.
- Go to the data model inspector and select the entity.
- The Codegen property is responsible for identifying how the class is generated.
- We can switch that over to Manual.

> @NSManaged is not a property wrapper – this is much older than property wrappers in SwiftUI. Instead, this reveals a little of how Core Data works internally: rather than those values actually existing as properties in the class, they are really just there to read and write from a dictionary that Core Data uses to store its information. When we read or write the value of a property that is @NSManaged, Core Data catches that and handles it internally – it’s far from a simple Swift string.

- Core Data is lazy.
  - Remember Swift’s lazy keyword, and how it lets us delay work until we actually need it? Core Data does much the same thing, except with data: sometimes it looks like some data has been loaded when it really hasn’t been because Core Data is trying to minimize its memory impact.
  - These are known as faults.
- Don't rely on this though. Maybe create computed properties that contain the nil coalescing if you don't wish to work with it later.

### Conditional saving
- Use to batch save because that has lower performance costs.
- Every managed object context has a hasChanges property. Wrap the save inside this.

```swift
if moc.hasChanges {
    try? moc.save()
}
```

### Constraints in Core Data
- An example of a constraint is adding a Unique constraint.
- This way we can add as many objects as we want, unique or not. But when it is saved, only one copy is saved.
- If there was some data already written that clashes with our constraint, we can choose how it should handle merging the data.
- If you want Core Data to write the changes, you need to open DataController.swift and adjust the loadPersistentStores() completion handler to specify how data should be merged.

```swift
// Add this to the data controller init inside the container
self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋