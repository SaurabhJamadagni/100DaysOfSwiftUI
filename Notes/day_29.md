# [Day 29](https://www.hackingwithswift.com/100/swiftui/29)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
25th July, 2022

### Lists

- They are the equivalent to `UITableView` from UIKit.
- Job of lists is to provide a scrolling table of data.
  > Pro tip: If your section header is just a string, you can just pass it as `Section("string")`
- By default, lists will look very similar to forms. But lists can be styled.
- **Lists can generate their own rows dynamically without a ForEach in place unlike Forms.**

### App bundles

- XCode takes all our assets, text files, etc. and stores them inside an app bundle.
- How do you access these files then?
- These are done using a **local URL** inside the bundle.
- It has to be optionally unwrapped as there is a change a file may not exist.

```swift
if let fileURl = Bundle.main.url(forResource: "some-file", extension: "txt") {
    // what you wanna do with the file.
}
```

- This is called as sandboxing, where we have our main app bundle and mini bundles associated.
- We can then access the contents of the file using

```swift
if let fileContents = try? String(contentsOf: fileURL) {
    // fileContents is a string.
}
```

### Working with strings

- Several APIs are available to work with strings that allow us to break strings into arrays, get rid of whitespaces and even check for spellings!
- We can use `components(separatedBy: "\n")` to break strings into an array of lines.
- We can check spellings using `UITextChecker`. It is part of Apple's old framework UIKit and thus has a different method of utilising it.
  - First create an object of the UITestChecker class.
  - Second, we have to tell our checker how much of our string we wish to check.
  - Swift can handle complex characters like emojis, but Objective-C can't.
  - To create the range, we use `NSRange` and have to provide the encoding to bridge between Swift and Objective-C
  - In checking mispelled words, we have provide the word, the range, starting point, if it should wrap back to the first mispelled check and the language.
  - Use code completions for this. No way you can exactly get the exact parameter list and or order.

```swift
func test() {
    let word = "swift"
    let checker = UITextChecker()
    // the utf16 is the encoding we mention
    let range = NSRange(location: 0, length: word.utf16.count)

    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

    // because Objective-C does not have the concepts such as optional
    // if the misspelled range is empty, a NSNotFound is returned.
    // check for that
    let allGood = misspelledRange.location == NSNotFound
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
