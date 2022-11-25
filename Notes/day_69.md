# [Day 69](https://www.hackingwithswift.com/100/swiftui/69)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
23rd November, 2022

### Introduction to MapKit
- We require a MKCoordinateRegion to bring in a map. It will take center and span as parameters.
  - Center means where you want the map to be centered.
  - Span is how much you want the map to span. Basically a zoom level.
- We can add markers by passing annotation markers to the Map instance.
- Use MapMarkers(Coordinates: ) and pass the required coordinates.

```swift
struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12),
                                                      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
            MapMarker(coordinate: location.coordinate)
        }
    }
}
```

- You can also use something like a MapAnnotation which can be customised to look however you want. MapMarkers will only give a generic pin marker.
- MapAnnotations will even let you allow to use NavigationLinks inside.

### Adding touch ID and face ID
- Face ID will require adding a description in the project properties.
- Go to `Bundle OS Type Code > Face ID Usage Description.`
- Import LocalAuthentication framework.
- Unlike Swift, Objective C uses a class called NSError for erros.
- You need to create a nil variable, which if in the end is not nil it implies that there was an error.
- Also, remember to create a context to work with the framework.

```swift
// Code block from HackingWithSwift

func authenticate() {
    let context = LAContext()
    var error: NSError?

    // check whether biometric authentication is possible
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        // it's possible, so go ahead and use it
        let reason = "We need to unlock your data."

        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
            // authentication has now completed
            if success {
                // authenticated successfully
            } else {
                // there was a problem
            }
        }
    } else {
        // no biometrics
    }
}
```

- It is a good idea to have a backup non-biometric authentication method such as making the user type up a password that can be used later.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
