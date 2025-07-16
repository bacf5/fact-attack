//
//  FetchService.swift
//  FactAttack
//
//  Created by Bruno Agustín Caruso Fassa on 12/07/2025.
//

import Foundation

struct FetchService {
    
    enum FetchError: Error {
        case badResponse
    }
    
    // Cat fetch
    let catImgURL = URL(string: "https://api.thecatapi.com/v1/images/search")!
    
    func fetchCatImg(from catApi: String) async throws -> Cats {
        
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
    
    
    // Dog fetch
    let dogImgURL = URL(string: "https://dog.ceo/api/breeds/image/random")!
    
    func fetchDogImg(from dogApi: String) async throws -> Dogs {
        let (data, response) = try await URLSession.shared.data(from: dogImgURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        let dogImg = try JSONDecoder().decode(Dogs.self, from: data)
        
        return dogImg
    }
    
    
    
    
    
    
    
    // For catimgurl at some point im gonna need an api-key wich i have.
    
//    let catImgURL = "https://api.thecatapi.com/v1/images/search"
//    let catFactsURL = "https://meowfacts.herokuapp.com/"
//    let dogImgURL = "https://dog.ceo/api/breeds/image/random"
//    let dogFactsURL = "https://dogapi.dog/api/v2/facts?limit=1"

    
    
}
