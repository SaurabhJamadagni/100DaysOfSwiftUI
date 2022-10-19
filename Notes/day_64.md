# [Day 64](https://www.hackingwithswift.com/100/swiftui/64)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
19th October, 2022

### Coordinators to manage SwiftUI view controllers
- SwiftUI coordinators are used to act as delegates for our view controllers.
- Delegates are objects that respond to events that happen else where.
- We'll need a `Coordinator` class.
- Assigning a delegate tells the ViewController who will be dealing with the changes.
- We don’t call makeCoordinator() ourselves; SwiftUI calls it automatically when an instance of ImagePicker is created.
- We need Coordinator to be a class as we need it to inherit from `PHPickerViewControllerDelegate` and `NSObject`.

### Saving to album
- To save to a user's album, you need to change the configuration of the app.
- We need to include a permission asking the user to access their album.
- Saving will be done using the function `UIImageWriteToSavedPhotosAlbum()`
- This function will take four parameters. The first one is the image. The second and the third are important.
- They will tell us what happens next after the image is saved. This is crucial because that is our confirmation that the image is saved.

> in place of the first nil we should point to an object, and in place of the second nil we should point to the name of the method that should be called.

- The object we provide must be a class, and it must inherit from NSObject. This means we can’t point to a SwiftUI view struct.
- The method is provided as a method name, not an actual method.
- We provide any sort of data in the forth parameter and it will be passed back to us upon the completion of the save operation.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋