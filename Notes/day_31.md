# [Day 30](https://www.hackingwithswift.com/100/swiftui/30)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
27th July, 2022

- Challenge and Review day for Project 5 - WordScramble

### Challenge - 1

- Do not allow words shorter than three letter or the root word.
  - We can solve the root word problem by just appending the rootWord inside the usedWords array and it will pass under the check of isOriginal.
  - But that alert will be very confusing for the user.
  - Thus to solve that problem, we create a new check and also guard against it inside the addWord method.
  - Similar for the 3-letter minimum limit.

```swift
// Function for checking if the word is the root word
func isRootWord(word: String) -> Bool {
    return word == rootWord
}

// Function to check word is atleast three letters long
func isAppropriateLength(word: String) -> Bool {
    return word.count >= 3
}

// adding checks in the addWord() function
guard !isRootWord(word: answer) else {
    wordError(title: "Used the root word!", message: "You can do better mate.")
    return
}

guard isAppropriateLength(word: answer) else {
    wordError(title: "Word too short!", message: "Think big. Go large!")
    return
}
```

### Challenge - 2

- Add a button in the navigation bar to restart the game.
  - add a button inside the toolbar modifier
  - create function `restartGame` that reinitializes all necessary variables and then calls `startGame` to randomly choose a new root word.

```swift
func restartGame() {
    newWord = ""
    usedWords.removeAll()
    startGame()
}

// The toolbar modifer
.toolbar {
    Button(role: .destructive) {
        restartGame()
    } label: {
        Text("Restart")
        Image(systemName: "gobackward")
    }
}
```

### Challenge - 3

- Add a Score Text view to keep count
  - A basic system where the word.count is summed into the score for a valid word
  - Create a new variable `score` and increment when a word is added.
  - Create a ToolbarItemGroup. Add the label along with the button and display the score.

```swift
// Just the code for the ToolbarGroupItem
ToolbarItemGroup(placement: .principal) {
    HStack {
        Text("Score: \(score)")

        Spacer()

        Button(role: .destructive) {
            restartGame()
        } label: {
            Text("Restart")
            Image(systemName: "gobackward")
        }
    }
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
