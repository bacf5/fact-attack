import Foundation
import SwiftUI

// FecthController
struct FetchService {
    
    enum ConfigDecoder {
        static var DucksApiKey: String {
            guard let key = Bundle.main.infoDictionary?["DUCK_API_KEY"] as? String else {
               fatalError("Duck API key not found. Please add it to the Info.plist")
            }
            return key
        }
    }
    
    
    private enum FetchError: Error {
        case badResponse
    }
    
    // Cat fetch
    private let catImgURL = URL(
        string: "https://api.thecatapi.com/v1/images/search"
    )!
    
    func fetchCatImg() async throws -> [Cats] {
        
        // Fetch
        let (data, response) = try await URLSession.shared.data(from: catImgURL)
        
        // handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        // Decode data
        let catImg = try JSONDecoder().decode([Cats].self, from: data)
        
        // return img
        return catImg
        
        
    }
    
    // Fetch cat fact
    
    private let catFactURL = URL(string: "https://meowfacts.herokuapp.com/")!
    
    func fetchCatFact() async throws -> CatsFact {
        
        let (data, response) = try await URLSession.shared.data(
            from: catFactURL
        )
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let catFact = try JSONDecoder().decode(CatsFact.self, from: data)
        
        return catFact
    }
    
    
    
    // Dog fetch
    private let dogImgURL = URL(
        string: "https://dog.ceo/api/breeds/image/random"
    )!
    
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
        
        let (data, response) = try await URLSession.shared.data(
            from: dogFactURL
        )
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let dogFact = try JSONDecoder().decode(DogsFact.self, from: data)
        
        return dogFact
    }
    
    //    --- [UPDATE] ---
    
    // Fetch duck img
    
//    new API: https://duck-api.netlify.app/api/image/random
//    old API: https://random-d.uk/api/v2/random
    
    private let duckImageURL = URL(string:"https://duck-api.netlify.app/api/image/random")!
    
    func fetchDuckImg() async throws -> Ducks {
        var request = URLRequest(url: duckImageURL)
        request.httpMethod = "GET"
        request.setValue(ConfigDecoder.DucksApiKey, forHTTPHeaderField: "X-api-key")
        
        let (data, response) = try await URLSession.shared.data(
            for: request
        )
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let duckImg = try JSONDecoder().decode(Ducks.self, from: data)
        
        return duckImg
    }
    
    // Fetch fact from my API
    
    private let duckFactURL = URL(
        string: "https://duck-api.netlify.app/api/facts/random"
    )!
    
    func fetchDuckFact() async throws -> DucksFact {
        var request = URLRequest(url: duckFactURL)
        request.httpMethod = "GET"
        request
            .setValue(
                ConfigDecoder.DucksApiKey,
                forHTTPHeaderField: "X-api-key"
            )
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let duckFact = try JSONDecoder().decode(DucksFact.self, from: data)
        
        return duckFact
        
    }
    
}
