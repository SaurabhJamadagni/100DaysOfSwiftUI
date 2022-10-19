# [Day 63](https://www.hackingwithswift.com/100/swiftui/63)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
18th October, 2022

### Core Image Framework
- SwiftUI's Image is a good thing when you want to render an image, but it does not provide pixel data as such.
- Three other types of Image apart from the one of SwiftUI are:
  - UIImage: Comes from UIKit. This is an extremely powerful image type capable of working with a variety of image types, including bitmaps (like PNG), vectors (like SVG), and even sequences that form an animation.
  - CGImage: Comes from CoreGraphics. Essentially just a two-dimensional array of pixels.
  - CIImage: Comes from CoreImage. This stores all the information required to produce an image but doesn’t actually turn that into pixels unless it’s asked to.

### Implementing CoreImage
- Let's look at a more simple-filter approach to manipulating images.
- We first need to have our input image converted to UIKit > CIImage.
- Then we need a context and a filter property.
- The filter property can be assigned whatever filter we are working with and then its properties can be changed.
- We need to follow a string of operations from here to reach back to a SwiftUI image.
- The output of the image needs to be converted to a CIImage -> CGImage -> UIImage -> Image.

```swift
// Code example

func loadImage() {
    guard let inputImage = UIImage(named: "Example") else { return }
    let beginImage = CIImage(image: inputImage)

    let context = CIContext()
    let currentFilter = CIFilter.sepiaTone()
    currentFilter.inputImage = beginImage
    currentFilter.intensity = 1

    // get a CIImage from our filter or exit if that fails
    guard let outputImage = currentFilter.outputImage else { return }

    // attempt to get a CGImage from our CIImage
    if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
        // convert that to a UIImage
        let uiImage = UIImage(cgImage: cgimg)

        // and convert that to a SwiftUI image
        image = Image(uiImage: uiImage)
    }
}
```

- But this is ok if you are working with only one type of filter and you know what properties it has. For example, if we switch from sepiatone to crystallize for the filter, there's no intensity property then that will be changed.
- Thus we need to resort to the older API method.
- Here have a keys array that contains all the keys of a filter. Then check if the key is present in this to be set.

```swift
let amount = 1.0

let inputKeys = currentFilter.inputKeys

// kCIInput___Key are the different keys.

if inputKeys.contains(kCIInputIntensityKey) {
    currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
}
if inputKeys.contains(kCIInputRadiusKey) { 
    currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
}
if inputKeys.contains(kCIInputScaleKey) {
    currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
}
```

### Wrapping a UIViewController in a SwiftUI view
- This method is a bridge between UIKit and SwiftUI so that we access some libraries yet not available to SwiftUI, for example, in this case being able to use a photo picker from the gallery.
- To do that we need to create a new struct that conforms to the UIViewControllerRepresentable protocol.


```swift
// Code for the struct of a photopicker view controller.

struct ImagePicker: UIViewControllerRepresentable {
    // These function need to be very precise.

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        code
    }
}
```

> Tip: use `typealias UIViewControllerType = PHPickerViewController` (or whatever VC you need)
>
> This will give you an error that has the button 'fix' in Xcode. Pressing fix will bring in the required functions automatically. Then you can get rid of the typealias.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋