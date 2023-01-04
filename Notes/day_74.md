# [Day 74](https://www.hackingwithswift.com/100/swiftui/74)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
3rd Jan, 2023

### Useful labels for accessibility
- By defualt, if there is an image, during voiceover the label of the image will be read out.
- Depending on how the images are labelled and stored, it can be no use to the user.
- Thus we can provide seperate accessibility labels using the `.accessibilityLabel()` modifier.
- If an image has an onTapGesture, it acts like a button but voiceover will read it out as an image.
- Thus we can also give traits using the `.accessibilityAddTraits()` modifier. Ex,

```swift
Image(pictures[selectedPicture])
    .resizable()
    .scaledToFit()
    .onTapGesture {
        selectedPicture = Int.random(in: 0...3)
    }
    .accessibilityAddTraits(.isButton)
```

- We can also remove traits using `.accesssibilityRemoveTraits()`.

### Having a clean view hierarchy
- Voiceover users use the feature with quite a speed and fluency. 
- We must try to stop having views being read out that bring no information to the user. For example, some image might serve only as a bullet, so it can be marked decorative. Ex:

```swift
Image(decorative: "character")
```

- It will still read it out if it has important traits such as isButton.
- We can also hide a view entirely using `.accessibilityHidden(Bool)`

### Adjustable actions
> Adjustable actions hand us the direction the user swiped, and we can respond however we want. There is one proviso: yes, we can choose between increment and decrement swipes, but we also need a special default case to handle unknown future values – Apple has reserved the right to add other kinds of adjustments in the future.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋