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
    
    var catImg: Cats
    var catFact: CatsFact
    
 
    init() {
        let decoder = JSONDecoder()
        
        let catData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecat", withExtension: "json")!)
        
        catImg = try! decoder.decode(Cats.self, from: catData)
        
        let catFactData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecatfacts", withExtension: "json")!)
        
        catFact = try! decoder.decode(CatsFact.self, from: catFactData)
    }
    
    func getData(for cat: String) async {
        status = .fetching
        
        do {
            catImg = try await fetcher.fetchCatImg()
            
            catFact = try await fetcher.fetchCatFact()
            
        } catch {
            status = .failed(error: error)
        }
    }
    
}
