# [Day 53](https://www.hackingwithswift.com/100/swiftui/53)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
9th September, 2022

- Start of project 11!

> write stupid code that uses smart objects

### Creating a custom component with @Binding
- Basically if you have a toggle, you can control what variable is bound to it that gets toggled.
- How do you control which other values are affected by it though?
- This is where `Binding` comes into play.
- All SwiftUI components have some properties that they are bound to. Understanding how Binding works allows us to create custom UI components.
- Consider this,

```swift
struct PushButton: View {
    let title: String
    @State var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember me?", isOn: rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}
```

- Running this code will change the gradient as intended for the button. But the text view doesn't reflect the changes in the boolean. We know the change is happening as the button reflects it so why is this happening?
- What happens is we have created a **one-way flow of information**.
- When creating this button, we pass the initial value of `rememberMe` which is assigned to `isOn` but changes in `isOn` are not sent back to ContentView.
- This is where Binding comes into play so that these two variables can reflect the changes in the two variables.
- To fix this, we wrap the variable of the component with the property wrapper of `@Binding` and when using the component in ContentView, we use the $ sign.

### TextEditor
- For longer string inputs from the user instead of TextField.
- Make sure the TextEditor doesn't go outside the safe area. To do that, use a Form or something.

### Introduction to CoreData
- Core Data is an object graph and persistence framework, which is a fancy way of saying it lets us define objects and properties of those objects.
- CoreData needs to know what kind of data we will have and how it all relates. To do that we create a new file with the extenion `xcdatamodeld`.

- Create a variable of the type `NSPersistentContainer`. This allows us to interact with our data model.
- This doesn't actually load the data. To do that, we have to use `loadPersistentStores()` on the container.
- All the data isn't loaded all at the same time instantly. But atleast CoreData can see what needs to be brough in.
- Things can go wrong when loading data. Not much we can do then except show an error message and hope relaunching works out. But do take this into consideration.
- We can make use of the `Environment` when working in Swift. This way rather than every view trying to create a new instance of the model, we can store it in the SwiftUI Environment so that it is accessible to all.
- This is done in the `*App.swift` file by adding the marked lines.

```swift
struct BookwormApp: App {
    @StateObject private var dataController = DataController() // This line
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)  // And this line.
        }
    }
}
```
- *managed object contexts* - These are the live version of your data. When objects are loaded and changed, these changes only exist in the local memory until they are saved in the persistent stores.
- *viewContext* allows us to work with Data in memory which is much faster than constantly reading and writing it to disk.
- We must save these changes at some point if we want them to exist when the app runs next but we can also choose to discard them.

#### Retrieving data
- This is done using a fetch request. Here, we can create a filter or sort and the matching data is sent back.
- Use the property wrapper `@FetchRequest`. It takes atleast one parameter describing how we want the results to be sorted.

```swift
@FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
```

- This will create a fetch request that doesn't have any sorting rules and store it in `students`.
- Values in this students will most likely always be optional even if you declared it not to be so.
- When we created the `Students` entity in CoreData, it automatically creates a new class for us that inherits from NSManagedObject.
- The objects of this class are called managed because CoreData is looking after them.
- All the managed objects live inside a managed object context.
- To add and remove data we need access to this managed object context.

```swift
// Creating the context variable.
@Environment(\.managedObjectContext) var moc
```

- To add an element we create a new instance of this class and pass the context as parameter.

```swift
let student = Student(context: moc)
```

- Saving the changes is done using `context.save()`. This is a throwing function so take care of that.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋