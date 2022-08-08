# [Day 40](https://www.hackingwithswift.com/100/swiftui/40)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
5th August, 2022

### Decoding by extending Bundle

- We can do so so that the main content view file remains clean and also allows for added functionality such as generics.

```swift
extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        // checking if the file is present
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        // checking if the file has data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        // checking if the file is decodable
        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
```

### Using generics with Codable

- To make a method generic, we give it a placeholder for certain types. This is written in angle brackets (< and >) after the method name but before its parameters.

```swift
// example
func decode<T>(_ file: String) -> [String: Astronaut] {
   ...
   ..
   ......
}
```

- If the function is used to decode and we must make sure that it conforms to certain protocols, we can mention that while mentioning the type.

```swift
func decode<T: Codable>(_ file: String) ...
```

- Every mention of the data type should be replaced by the generic in the method.
- When calling this method, we must type annotate the variable with the data type that we expect to be returned so the generics understand what is expected.

### Formatting dates while decoding

- Makes use of the `DateFormatter` class
- To use this we need to mention the format our dates will be present in the data and mention the same exact format.
- Remember that the letter m to specify months needs to be capital.
- Here we also need to make sure that the property in our codable struct is of the type `Date` and not a String.

```swift
// Inside the bundle decoder file
let formatter = DateFormatter()
formatter.dateFormat = "y-MM-dd"
decoder.dateDecodingStrategy = .formatted(formatter)
```

### Using custom colours

- We can do this by using the asset catalogue but it becomes very difficult to track using version control.
- So we can extend the `Color` class but it is part of a Protocol called `ShapeStyle`.
- So we can extend that class so that it implements our colour only when any element is used as a colour.
- `ShapeStyle` protocol can never be used directly. Color, Gradients, Path, are some of the concrete implementation in SwiftUI based on this protocol.

```swift
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }

    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
```

### Summary

- Implemented a decoding function by extending the Bundle class.
- Used generics with Codable to extend the decoding functionality to more structs.
- Learned how to format dates while decoding usigng DateFormatter.
- Used custom colours by extending the ShapeStyle protocol only when the Color class is used.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
