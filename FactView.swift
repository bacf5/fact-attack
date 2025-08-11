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
                    .frame(width: geo.size.width * 1.6, height: geo.size.height)
                
                VStack {
                    
                    Spacer(minLength: 60)
                    
                    Text("\"\(vm.catFact.data.first ?? "Loading fact...")\"")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.7))
                        .clipShape(.rect(cornerRadius: 25))
                    //                        .padding(.horizontal)
                    
                    ZStack(alignment: .bottom) {
                        AsyncImage(url: URL(string: vm.catImg.url)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        
                    }
                    .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                    .clipShape(.rect(cornerRadius: 50))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                    Text("Random Fact Attacc!🐾")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.orange.opacity(0.8))
                        .clipShape(.rect(cornerRadius: 10))
                        .shadow(color: .black, radius: 3)
                    }
                    
                    Spacer(minLength: 95)
                        
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    FactView(animal: "cat")
}
