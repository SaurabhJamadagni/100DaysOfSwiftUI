# [Day 49](https://www.hackingwithswift.com/100/swiftui/49)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
22nd August, 2022

### Codable conformance to Published properties
- Any data type will conform to `Codable` as long as its properties conform to Codable.
- If any property is `Published` then it won't work.
- Published type is entirely generic. So we can't make an instance of `Published`, but we can make an instance of `Published<String>`.
  - This is the same like how we can't create an instance of a set or an array or a dictionary in itself. We also have to mention what kind of data will these collections have inside.

**Steps to conform to Codable**
- This is done using an enum that conforms to a special protocol called CodingKey.
- Every case in our enum is the name of a property we want to load and save.
- The next task is to create a custom initializer that will be given some sort of container, and use that to read values for all our properties.
- Anyone who subclasses this class must override and provide their own implementation for the initalizer. That's why the `required` keyword.
- Inside the method we ask our Decoder instance for a container matching all the coding keys we already set in our CodingKey struct
- We’ve made an initializer so that Swift can decode data into this type, but now we need to tell Swift how to encode this type.

```swift
class User: ObservableObject, Codable {
    @Published var name = "Saurabh"

    // Enum that conforms to CodingKey.
    // Cases are the published properties of the class.
    enum CodingKeys: CodingKey {
        case name
    }

    // Initializer that decodes from the container that is our enum.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

    // Lastly implementing an encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
```

### URLSession in SwiftUI
- An iOS device can perform more than a billion operations. But networking calls can return much slower speeds based on the network connection. 
- Thus, we need to make use of two keywords - `async` and `await`.
- We cannot use `.onAppear` on async functions.
- So we can use the task modifier instead of onAppear and then call the async function using the `await` keyword.

> iOS will do a little caching of data, so if the URL is fetched twice back to back then the data will get sent back immediately rather than triggering a sleep.

- The return value from a network call will most likely be some data followed by metadata on how the networking call went.

```swift
func loadData() async {
    guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
        print("Invalid URL")
        return
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
            results = decodedData.results
        }
    } catch {
        print("Invalid Data")
    }
}
```

### Loading Images from the web
- Use `AsyncImages`
- Using the scale paramter, we can tell SwiftUI that the image that is passed should be in the 3x box in case we had added the image inside the assets.
- **Understand that the modifiers that you apply to AsyncImage do not apply to the image that will be retrieved. They apply to AsyncImage. So modifiers such as `resizable` will not work.**
- To modify the images that are received, we must use a closure where we can apply the required modifiers.
- We can also have a placeholder trailing closure, that allows us to customize the placeholder image.

```swift
AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
    image
        .resizable()
} placeholder: {
    Color.red
}
.frame(width: 200, height: 200)
```

- Another way to create an AsyncImage with more control is

```swift
AsyncImage(url: URL(string: "https://hws.dev/img/bad.png") { phase in
    if let image = phase.image {
        image
            .resizable()
            .scaledToFit()
    } else if phase.error != nil {
        Text("There was an error loading the image.")
    } else {
        ProgressView()
    }
}
.frame(width: 200, height: 200)
```

- Using the above method, we can figure out the why behind if our image doesn't load--is it because there was an error or its just loading.

### Validating inputs in Forms
- Modifier used for this purpose is `disabled`().
- It takes in a condition and if the condition is true, whatever form of input it is attached to will not take user input.

```swift
// Following code takes email and password as input
// Submit button is disabled till both email and password are entered.
@State private var email = ""
@State private var password = ""

var body: some View {
    Form {
        Section {
            TextField("Enter email", text: $email)
            TextField("Enter a password", text: $password)
        }
        
        Section {
            Button("Create Account") {
                print("Creating Account")
            }
        }
        .disabled(email.isEmpty || password.isEmpty)
    }
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋