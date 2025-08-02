//
//  FetchService.swift
//  FactAttack
//
//  Created by Bruno Agustín Caruso Fassa on 12/07/2025.
//

import Foundation

// FecthController
struct FetchService {
    
    private enum FetchError: Error {
        case badResponse
    }
    
    // Cat fetch
    private let catImgURL = URL(string: "https://api.thecatapi.com/v1/images/search")!
    
    func fetchCatImg() async throws -> Cats {
        
        // Fetch
        let (data, response) = try await URLSession.shared.data(from: catImgURL)
        
        // handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        // Decode data
        let catImg = try JSONDecoder().decode(Cats.self, from: data)
        
        // return img
        return catImg
        
        
    }
    
    // Fetch cat fact
    
    private let catFactURL = URL(string: "https://meowfacts.herokuapp.com/")!
    
    func fetchCatFact() async throws -> CatsFact {
        
        let (data, response) = try await URLSession.shared.data(from: catFactURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let catFact = try JSONDecoder().decode(CatsFact.self, from: data)
        
        return catFact
    }
    
    
    
    // Dog fetch
    private let dogImgURL = URL(string: "https://dog.ceo/api/breeds/image/random")!
    
    func fetchDogImg() async throws -> Dogs {
        let (data, response) = try await URLSession.shared.data(from: dogImgURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        let dogImg = try JSONDecoder().decode(Dogs.self, from: data)
        
        return dogImg
    }
    
    // Fetch dog fact
    
    private let dogFactURL = URL(string: "https://dogapi.dog/api/facts")!
    
    func fetchDogFact() async throws -> DogsFact {
        
        let (data, response) = try await URLSession.shared.data(from: dogFactURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let dogFact = try JSONDecoder().decode(DogsFact.self, from: data)
        
        return dogFact
    }
    
//    --- [UPDATE] ---
    
    // Fetch duck img
    
    // Fetch duck fact
    
    
    
    
    
    
    // For catimgurl at some point im gonna need an api-key wich i have.
    
//    let catImgURL = "https://api.thecatapi.com/v1/images/search"
//    let catFactsURL = "https://meowfacts.herokuapp.com/"
//    let dogImgURL = "https://dog.ceo/api/breeds/image/random"
//    let dogFactsURL = "https://dogapi.dog/api/facts"

    
    
}
