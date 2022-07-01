# [Day 5](https://www.hackingwithswift.com/100/swiftui/5)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
1st July, 2022

### If statement
- Programs involve making choices, which swift allows us to do using the `if` statement.

```swift
if someCondition {
    print("Do something")
}
```

- The body of the if statement is only executed if the condition is met.

Consider the code,

```swift
let age = 18
if age >= 18 {
    // adult is printed if age is greater than or equal to 18
    print("Adult)
}
```

- One of the conditons that you might have to check for is if a string is empty.
- We could do it using the `==` operator against an empty string `""`.
- Or we could compare the letters in the strings to 0. If the string is empty it should have 0 words. 
    - Swift supports all sorts of complex strings.
    - Swift doesn't store the length of the string like other langauges. It manually counts the characters in a string when the `count` function is invoked.
    - Thus it is not an efficient method, especially when the strings can get large.
- A more efficient way is to use `isEmpty`. If the string is an empty string, a true **boolean** will be returned


### Multiple if conditions
- If two conditions are mutually exclusive, it is not very efficient to be writing down ifs for every condition.
- Thus we can add an `else` block.

```swift
if conditionIsTrue {
    print("do this")
} else {
    print("don't do this")
}
```

- use a `else if` if you want even more conditions.
- Using logical operators such as `and (&&)`, `not (!)`, `or (||)` can be used to combine conditions.

### Switch statement
- We can have as many else ifs as we want, but it can affect readability. This is where we use switch.
- In switch, we tell which value do we want to be checked and the different cases are listed.
- Swift **does not need break statements** in switch cases like languages such as C++ or Java. It will only execute the bit that matches the condition.
- Instead if you want swift to execute the next after the correct case, use `fallthrough`
- All our switch statements have to be exhaustive in swift.

### Ternary Operator
- One of the other ways of checking conditions in swift. Used quite often in SwiftUI.
- The `?` is the ternary operator.
- Syntax: `let varToStoreResult = condition ? true case result : false case result`
Example,
```swift
let age = 18
let canVote = age >= 18 ? true : false
```
- But why use it? Why does it matter?
    - There will be cases in SwiftUI where a lot of conditions are stacked up. In this case writing ifs and elses becomes extremely difficult.
    - This is where the ternary operator is utilized heavily.

### Summary
Checking conditions is an important part of a program. Conditions can be checked using if-else, switch or the ternary operator in swift. We can have as may if and else statements as we want. Switch helps readability. The ternary operator is important as it has frequent usage in SwiftUI.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋