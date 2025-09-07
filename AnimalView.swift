//
//  AnimalView.swift
//  FactAttack
//
// before was named FactView.swift
//  Created by Bruno Agustín Caruso Fassa on 02/08/2025.
//

import SwiftUI
import AVFAudio

struct AnimalView: View {
    
    @State private var showPhotoView = false
    @State private var uiImage = UIImage()
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isButtonDisabled = false
    @State private var isButtonPressed = false
    let vm = ViewModel()
    let animal: String
    let soundName = "pop"

    
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                if (animal == "cat") {
                    Image(animal.self)
                        .resizable()
                        .frame(
                            width: geo.size.width * 1.8,
                            height: geo.size.height * 1
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
                                            .transition(
                                                .opacity
                                                    .animation(
                                                        .easeIn(duration:0.5)
                                                    )
                                            )
                                            .onTapGesture {
                                                let renderer = ImageRenderer(
                                                    content: image
                                                )
                                                uiImage = renderer.uiImage ?? UIImage()
                                                showPhotoView.toggle()
                                            }
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                }
                                .frame(
                                    width: geo.size.width / 1.1,
                                    height: geo.size.height / 1.8
                                )
                                .clipShape(.rect(cornerRadius: 50))
                                .shadow(color: .black, radius: 15)
                            case .failed(let error):
                                Text(error.localizedDescription)
                            }
                            
                            Spacer()
                            
                        }
                        
                        Button {
                            isButtonDisabled.toggle()
                            isButtonPressed.toggle()
                            
                            guard let soundFile = NSDataAsset(name: soundName) else {
                                print(
                                    "😵‍💫 could not read file name \(soundName)"
                                )
                                return
                            }
                            do {
                                audioPlayer = try AVAudioPlayer(
                                    data: soundFile.data
                                )
                                audioPlayer.play()
                            } catch {
                                print(
                                    "😵‍💫 could not read file name \(error.localizedDescription) creating audioPlayer"
                                )
                            }
                            
                            Task {
                                await vm.getData(for: animal)
                                try await Task
                                    .sleep(nanoseconds: 3 * 1_000_000_000)
                                isButtonDisabled.toggle()
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
                        .sensoryFeedback(.success, trigger: isButtonPressed)
                        .disabled(isButtonDisabled)
                        
                        
                        Spacer(minLength: 95)
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                } else if (animal == "dog") {
                    
                    Image(animal.self)
                        .resizable()
                        .frame(
                            width: geo.size.width * 1.8,
                            height: geo.size.height * 1
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
                                            .transition(
                                                .opacity
                                                    .animation(
                                                        .easeIn(duration:0.5)
                                                    )
                                            )
                                            .onTapGesture {
                                                let renderer = ImageRenderer(
                                                    content: image
                                                )
                                                uiImage = renderer.uiImage ?? UIImage()
                                                showPhotoView.toggle()
                                            }
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                }
                                .frame(
                                    width: geo.size.width / 1.1,
                                    height: geo.size.height / 1.8
                                )
                                .clipShape(.rect(cornerRadius: 50))
                                .shadow(color: .black, radius: 15)
                            case .failed(let error):
                                Text(error.localizedDescription)
                            }
                            
                            Spacer()
                        }
                        Button {
                            isButtonDisabled.toggle()
                            isButtonPressed.toggle()
                            
                            guard let soundFile = NSDataAsset(name: soundName) else {
                                print(
                                    "😵‍💫 could not read file name \(soundName)"
                                )
                                return
                            }
                            
                            do {
                                audioPlayer = try AVAudioPlayer(
                                    data: soundFile.data
                                )
                                audioPlayer.play()
                            } catch {
                                print(
                                    "😵‍💫 could not read file name \(error.localizedDescription) creating audioPlayer"
                                )
                            }
                            Task {
                                await vm.getData(for: animal)
                                try await Task
                                    .sleep(nanoseconds: 3 * 1_000_000_000)
                                isButtonDisabled.toggle()
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
                        .sensoryFeedback(.success, trigger: isButtonPressed)
                        .disabled(isButtonDisabled)
                        
                        Spacer(minLength: 95)
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                } else if (animal == "duck") {
                    
                    Image(animal.self)
                        .resizable() // scaledToFill()
                        .frame(
                            width: geo.size.width * 1.8,
                            height: geo.size.height * 1
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
                                Text("\(vm.duckFact.fact)")
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(.black.opacity(0.7))
                                    .clipShape(.rect(cornerRadius: 25))

                                
                                ZStack(alignment: .bottom) {
                                    AsyncImage(
                                        url: URL(string: vm.duckImg.url)
                                    ) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .transition(
                                                .opacity
                                                    .animation(
                                                        .easeIn(duration:0.5)
                                                    )
                                            )
                                            .onTapGesture {
                                                let renderer = ImageRenderer(
                                                    content: image
                                                )
                                                uiImage = renderer.uiImage ?? UIImage()
                                                showPhotoView.toggle()
                                            }
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                }
                                .frame(
                                    width: geo.size.width / 1.1,
                                    height: geo.size.height / 1.8
                                )
                                .clipShape(.rect(cornerRadius: 50))
                                .shadow(color: .black, radius: 15)
                                
                            case .failed(let error):
                                Text(error.localizedDescription)
                            }
                            Spacer()
                        }
                        Button {
                            isButtonDisabled.toggle()
                            isButtonPressed.toggle()
                            
                            guard let soundFile = NSDataAsset(name: soundName) else {
                                print(
                                    "😵‍💫 could not read file name \(soundName)"
                                )
                                return
                            }
                            
                            do {
                                audioPlayer = try AVAudioPlayer(
                                    data: soundFile.data
                                )
                                audioPlayer.play()
                            } catch {
                                print(
                                    "😵‍💫 could not read file name \(error.localizedDescription) creating audioPlayer"
                                )
                            }
                            Task {
                                await vm.getData(for: animal)
                                try await Task
                                    .sleep(nanoseconds: 3 * 1_000_000_000)
                                isButtonDisabled.toggle()
                            }
                        } label: {
                            Text("Duck Attacc! 🦆")
                                .font(.title)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.teal.opacity(0.7))
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(color: .black, radius: 3)
                        }
                        .sensoryFeedback(.success, trigger: isButtonPressed)
                        .disabled(isButtonDisabled)
                        
                        Spacer(minLength: 95)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
        .sheet(isPresented: $showPhotoView) {
            PhotoView(uiImage: uiImage, animal: animal)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AnimalView(animal: "duck")
}
