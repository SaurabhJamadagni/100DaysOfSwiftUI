# [Day 37](https://www.hackingwithswift.com/100/swiftui/37)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
2nd August, 2022

### Idenfiable protocol

- To identify unique instances we can either have an id which is computed using other properties or assign one during creating the instance.
- But each of those options has their own problem.
- So we can have a unique identifier using **UUID (universally unique identifier)**.
- We conform the struct to the `Identifiable` protocol.
- The only requirement of this protocol is that there must be a property id initialised using `UUID()`.
- This allows us to get rid of the id parameter in ForEach.

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
