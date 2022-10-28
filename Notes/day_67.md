# [Day 67](https://www.hackingwithswift.com/100/swiftui/67)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
26th October, 2022

Review and Challenge day for project 13 - Instafilter

### Challenge - 1
- Disable saving when there is no image.
  - Can be done using the `disabled` modifier. 
  - Condition to be passed is `image == nil`

### Challenge - 2
- Add a few more sliders for various properties.
  - It was difficult to disable a slider after it was activated once. 
  - First thought was to use a computed property. On second thought a property observer could have also been used.
  - I created a custom component that is optional in the view hierarchy.
  - This is then assigned only when the key is present in the input keys.
  - Else, nil is assigned which removes the slider completely from the main View.

```swift
// Slider UI component
struct CustomSlider: View {
    @Binding var value: Double
    let requiredKey: String
    
    var body: some View {
        HStack {
            Text(requiredKey)
            Slider(value: $value)
        }
    }
}

//In ContentView
@State private var intensitySlider: CustomSlider?
@State private var radiusSlider: CustomSlider?
@State private var scaleSlider: CustomSlider?

// Inside the primary VStack
intensitySlider?
    .onChange(of: filterIntensity, perform: { _ in applyProcessing() })

radiusSlider?
    .onChange(of: filterRadius, perform: { _ in applyProcessing() })

scaleSlider?
    .onChange(of: filterScale, perform: { _ in applyProcessing() })

// Function to load appropriate sliders
func loadSliders() {
    intensitySlider = filterKeys.contains(kCIInputIntensityKey) ? CustomSlider(value: $filterIntensity, requiredKey: "Intensity") : nil
    
    radiusSlider = filterKeys.contains(kCIInputRadiusKey) ? CustomSlider(value: $filterRadius, requiredKey: "Radius") : nil
    
    scaleSlider = filterKeys.contains(kCIInputScaleKey) ? CustomSlider(value: $filterScale, requiredKey: "Scale") : nil
}
```

### Challenge - 3 (WIP)
- Add three more filters of liking.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋