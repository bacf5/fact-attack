//
//  ContentView.swift
//  FactAttack
//
//  Created by Bruno Agustín Caruso Fassa on 10/07/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Cats", systemImage: "cat.fill") {
                FactView(animal: "cat").toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Dogs", systemImage: "dog.fill") {
                FactView(animal: "dog").toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}
