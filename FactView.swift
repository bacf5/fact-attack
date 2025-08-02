//
//  FactView.swift
//  FactAttack
//
//  Created by Bruno Agustín Caruso Fassa on 02/08/2025.
//

import SwiftUI

struct FactView: View {
    let vm = ViewModel()
    let animal: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(animal.self)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//                    .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    FactView(animal: "cat")
}
