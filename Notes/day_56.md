# [Day 56](https://www.hackingwithswift.com/100/swiftui/56)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
4th October, 2022

- Review and Challenge day for project 11 - Bookworm

### Challenge - 1
- Validate input in some way
  - I chose to use the disabled modifier that checks if the title and author textfields are entry.
  - If even one of them is empty, then the Save button is disabled.
  - Also add a default image for when the genre is not selected and defaults to 'Unknown'.

```swift
func checkInput() -> Bool {
    return title.isEmpty || author.isEmpty
}

// Adding the disabled modifier to the Save button section.
Section {
    Button("Save") {
        // Adds the book
        let newBook = Book(context: moc)    // Create an instance of class Book
        newBook.id = UUID()
        newBook.title = title
        newBook.author = author
        newBook.genre = genre.isEmpty ? "Unknown" : genre
        newBook.review = review
        newBook.rating = Int16(rating)
        
        try? moc.save()
        
        dismiss()
    }
}
.disabled(checkInput())
```

### Challenge - 2
- Modify such that books that are rated one star and highlighted differently.
  - Add .foreground modifier to title in ContentView

```swift
.foregroundColor(book.rating == 1 ? .red : .primary)
```

