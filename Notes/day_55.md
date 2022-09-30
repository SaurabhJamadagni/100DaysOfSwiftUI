# [Day 55](https://www.hackingwithswift.com/100/swiftui/55)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
26th September, 2022

- Creating previews when there is a CoreData object involved is tricky. Because that means creating a new instance of managed object context.
- This will require importing CoreData. `// This isn't working currently. Probably the new Xcode update.`

> Creating a managed object context involves telling the system what concurrency type we want to use.

- When you want to use a UI component that allows a binding variable to change the UI, but you want to use it statically then just pass it as constant.

### Sorting fetch requests
- Done using the `SortDescriptor`.
- Default is an ascending sort, but can be reversed.
- You can sort by multiple fields. For example, we may want to sort books by author first and then ratings.
- To do this add one more SortDescriptor using a comma.

```swift
@FetchRequest(sortDescriptors: [
    SortDescriptor(\.title),
    SortDescriptor(\.author)
]) var books: FetchedResults<Book>
```

### Deleting from the fetch request
- Here as we have a simple list, we can use the `onDelete` modifier. But we need to modify the modifier a little because we are no longer just deleting from an array.
- Pass in the index offsets and delete the respective book.
- Don't forget to save. It is not an array!

### Programatically going back a navigation view

> Apple provides very clear guidance on how we should label alert text, but it comes down to this: if it’s a simple “I understand” acceptance then “OK” is good, but if you want users to make a choice then you should avoid titles like “Yes” and “No” and instead use verbs such as “Ignore”, “Reply”, and “Confirm”.

- Here you basically use the Environment variable of `dismiss`. Call it when a certain action during the alert is triggered.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋