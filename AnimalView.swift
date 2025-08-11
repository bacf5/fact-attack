//
//  AnimalView.swift
//  FactAttack
//
// before was named FactView.swift
//  Created by Bruno Agustín Caruso Fassa on 02/08/2025.
//

import SwiftUI

struct AnimalView: View {
    let vm = ViewModel()
    let animal: String
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                if (animal == "cat") {
                    Image(animal.self)
                        .resizable()
                        .frame(
                            width: geo.size.width * 1.6,
                            height: geo.size.height
                        )
                    
                    VStack {
                        VStack {
                            Spacer(minLength: 60)
                            
                            switch vm.status {
                            case .notStarted:
                                EmptyView()
                            case .fetching:
                                ProgressView()
                            case .success:
                                Text(
                                    "\"\(vm.catFact.data.first ?? "Loading fact...")\""
                                )
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.rect(cornerRadius: 25))
                                
                                
                                ZStack(alignment: .bottom) {
                                    AsyncImage(
                                        url: URL(string: vm.catImg[0].url)
                                    ) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                }
                                .frame(
                                    width: geo.size.width / 1.1,
                                    height: geo.size.height / 1.8
                                )
                                .clipShape(.rect(cornerRadius: 50))
                            case .failed(let error):
                                Text(error.localizedDescription)
                            }
                            
                            Spacer()
                            
                        }
                        Button {
                            Task {
                                await vm.getData(for: animal)
                            }
                        } label: {
                            Text("Fact Attacc! 🐱")
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
                    
                } else if (animal == "dog") {
                    
                    Image(animal.self)
                        .resizable()
                        .frame(
                            width: geo.size.width * 1.6,
                            height: geo.size.height
                        )
                    
                    VStack {
                        VStack {
                            Spacer(minLength: 60)
                            
                            switch vm.status {
                            case .notStarted:
                                EmptyView()
                            case .fetching:
                                ProgressView()
                            case .success:
                                Text(
                                    "\"\(vm.dogFact.facts.first ?? "Loading fact...")\""
                                )
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.rect(cornerRadius: 25))
                                
                                
                                ZStack(alignment: .bottom) {
                                    AsyncImage(
                                        url: URL(string: vm.dogImg.message)
                                    ) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                }
                                .frame(
                                    width: geo.size.width / 1.1,
                                    height: geo.size.height / 1.8
                                )
                                .clipShape(.rect(cornerRadius: 50))
                            case .failed(let error):
                                Text(error.localizedDescription)
                            }
                            
                            Spacer()
                        }
                        Button {
                            Task {
                                await vm.getData(for: animal)
                            }
                        } label: {
                            Text("Fact Attacc! 🐶")
                                .font(.title)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.brown.opacity(0.8))
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(color: .black, radius: 3)
                        }
                        
                        Spacer(minLength: 95)
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AnimalView(animal: "dog")
}
