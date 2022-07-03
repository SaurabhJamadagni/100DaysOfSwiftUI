# [Day 7](https://www.hackingwithswift.com/100/swiftui/7)
[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
3rd July, 2022

### Functions
- If you wish to reuse a piece of code, you should consider creating a function with it.
Syntax:
```swift
func functionName(externalParam internalParam: datatype) {
    // function body
}
```
- `func` is the keyword that marks the beginning of a function.
- A function is called using the assigned function name.
- A function call has to be followed by `()`.
- When calling the function with parameters, we have to mention the name of the parameter in the call as well unlike other languages.
- Example, `functionName(externalParam: value)` is a valid call. `functionName(value)` is not a valid call.
- Between parameters and arguments, parameters are the placeholder, arguments are the values.
- Pass in the values in the order they were listed. (Obviously)

### Returning values from a function
- Functions often have to send back some value after performing the task they were assigned.
- To make a function return something we need to use the arrow `->` and mention the `datatype` of the value that will be returned.
- The function will return whatever value is present after the keyword `return` as long as it matches the return datatype.
- If your function doesn’t return a value, you can still use return by itself to force the function to exit early.

### Returning multiple values from a function
- We can do this by returning Arrays or dictionaries but that is bad code.
- Instead a better way to do this is using tuples.
- tuples use `()` instead of `[]`.
- `fun.. ... -> (firstName: String, lastName: String)` is an example of a tuple.
- To print out its contents we can use the `.` operator. Example, `user.lastName`
- This eliminates the chance of typos when mentioning the keys.
- In the case of dicitonaries we also have to worry about optional and provide defualts. In tuples if two elements are present then they have to have a value.

### Parameter labels
- It is important to have parameters name that are easily recognisable even if you see your code after a long time.
- We can also have multiple functions with the same name but **different parameters**.
- But sometimes having the parameter name when calling the function can be redundant and a bit too messy.
- Thus we can add an `_` before the parameter in the function definition so that we don't need to mention it when the function is called.

```swift
func isUppercased(string: String) {
    return string == string.uppercased()
}

// to call this function
string = "hello"
print(isUppercased(string: string))

//or you can use an _
func isUppercased(_ string: String) {
    return string == string.uppercased()
}

// to call this function
print(isUppercased(string))
```
- We are basically getting rid of the external parameter name.
- We can also use words like `for` or `with` as external parameter names to increase readability.
- Basically replace the underscore with the word to be the external parameter name.

### Summary
- Functions are used to modularise a certain block of code that can be reused.
- Functions can return a value to where they were called of a specified datatype.
- Multiple values can be returned using tuples. 
- Having good parameter names is important for readability.
- External parameter name is used when calling the function. We can exclude it using an `_` or have make it verbose.
- Internal parameter names are the ones used inside the function body.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋