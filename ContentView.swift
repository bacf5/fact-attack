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
                Text("Cats view").toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Dogs", systemImage: "dog.fill") {
                Text("Dogs view").toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}
