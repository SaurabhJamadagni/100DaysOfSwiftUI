# [Day 42](https://www.hackingwithswift.com/100/swiftui/42)

[Saurabh Jamadagni](https://github.com/SaurabhJamadagni)<br>
10th August, 2022

- Challenge and review day for day 42 of 100DaysOfSwiftUI

### Challenge - 1

- Add launch date to MissionView
  - Add a simple Text view in the appropriate position to display the launch date.

```swift
// In Mission.swift
var dateStringForMissionView: String {
    return launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
}

// In MissionView.swift
// After 'Mission Highlights'
Text("Launched \(mission.dateStringForMissionView)")
    .foregroundColor(.secondary)
    .padding(.bottom, 5)
```

### Challenge - 2

- Extract pieces of code into their own views
  - Can be done for the horizontal scroll in MissionView and the Custom dividers that are created.

```swift
// In MissionView.swift
struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct AstronautCarousel: View {
    let crew: [CrewMember]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            ZStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 260, height: 180)
                                    .shadow(radius: 10)

                                LinearGradient(stops: [
                                    .init(color: .clear, location: 0.3),
                                    .init(color: .black, location: 0.98)
                                ], startPoint: .top, endPoint: .bottom)


                                HStack {
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text(crewMember.astronaut.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text(crewMember.role)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding([.bottom, .horizontal])

                                    Spacer()
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

// In ContentView.swift
struct DisplayMissionNameAndLaunch: View {
    let mission: Mission

    var body: some View {
        VStack {
            Text(mission.displayName)
                .font(.headline)
                .foregroundColor(.white)
            Text(mission.formattedDateString)
                .font(.caption)
                .foregroundColor(.white.opacity(0.5))
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(.lightBackground)
    }
}
```

### Challenge - 3

- Create a button that toggles between list and grid view
  - To stylise list we use `.listStyle(.plain)`
  - Row colours are set using `listRowBackground`
  - Padding and clipshape work in normally. Just understand the modifier order
  - We create a button in the `toolbar` that toggles between showing grid and list view

```swift
// List layout struct
struct ListLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]

    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .padding()

                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                            Text(mission.formattedDateString)
                                .font(.caption)
                        }
                    }

                }
                .listRowBackground(Color(red: 0.2, green: 0.2, blue: 0.3))
                .listRowSeparatorTint(Color(red: 0.1, green: 0.1, blue: 0.2))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        .listStyle(.plain)
        .navigationTitle("MoonShot")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

// Grid layout struct
struct GridLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()

                            DisplayMissionNameAndLaunch(mission: mission)

                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .navigationTitle("MoonShot")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}


// Create a boolean to toggle between the views
@State private var gridIsEnabled = true

// Inside body of ContentView
NavigationView {
    // Use a group otherwise can't use if-else
    Group {
        if gridIsEnabled {
            GridLayout(missions: missions, astronauts: astronauts)
        } else {
            ListLayout(missions: missions, astronauts: astronauts)
        }
    }
    .toolbar {
        Button {
            gridIsEnabled.toggle()
        } label: {
            Image(systemName: gridIsEnabled ? "list.bullet" : "square.grid.2x2")
                .foregroundColor(.white)
        }
    }
}
```

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
