//
//  ViewModel.swift
//  FactAttack
//
//  Created by Bruno Agustín Caruso Fassa on 16/07/2025.
//


import Foundation

@Observable
@MainActor
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var catImg: [Cats]
    var catFact: CatsFact
    var dogImg: Dogs
    var dogFact: DogsFact
    var duckImg: Ducks
    
 
    init() {
        let decoder = JSONDecoder()
        
        let catData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecat", withExtension: "json")!)
        
        catImg = try! decoder.decode([Cats].self, from: catData)
        
        let catFactData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecatfacts", withExtension: "json")!)
        
        catFact = try! decoder.decode(CatsFact.self, from: catFactData)
        
        let dogData = try! Data(contentsOf: Bundle.main.url(forResource: "sampledog", withExtension: "json")!)
        
        dogImg = try! decoder.decode(Dogs.self, from: dogData)
        
        let dogFactData = try! Data(contentsOf: Bundle.main.url(forResource: "sampledogfacts", withExtension: "json")!)
        
        dogFact = try! decoder.decode(DogsFact.self, from: dogFactData)
        
        let duckData = try! Data(contentsOf: Bundle.main.url(forResource: "sampleduck", withExtension: "json")!)
        
        duckImg = try! decoder.decode(Ducks.self, from: duckData)
    }
    
    func getData(for animal: String) async {
        
        status = .fetching
        
        // Separate the loads with an if? statement or something like that depends on the tab we are [Cats-Dogs-Ducks]
        
        if (animal == "cat") {
            do {
                
                catImg = try await fetcher.fetchCatImg()
                catFact = try await fetcher.fetchCatFact()
            
                status = .success
            } catch {
                status = .failed(error: error)
            }
        } else if (animal == "dog") {
            do {
                dogImg = try await fetcher.fetchDogImg()
                dogFact = try await fetcher.fetchDogFact()
                
                status = .success
            } catch {
                status = .failed(error: error)
            }
            
        } else if (animal == "duck") {
            do {
                duckImg = try await fetcher.fetchDuckImg()
                
                status = .success
            } catch {
                status = .failed(error: error)
            }
        }
        
//        do {
//            catImg = try await fetcher.fetchCatImg()
//            catFact = try await fetcher.fetchCatFact()
//            dogImg = try await fetcher.fetchDogImg()
//            dogFact = try await fetcher.fetchDogFact()
//            
//            status = .success
//            
//        } catch {
//            status = .failed(error: error)
//        }
    }
    
}
