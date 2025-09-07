import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Cats", image: "cat-tabview") {
                AnimalView(animal: "cat").toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Dogs", image: "dog-tabview") {
                AnimalView(animal: "dog").toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Ducks", image: ("duck-tabview")) {
                AnimalView(animal: "duck").toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}
