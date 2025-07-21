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
 
    
    
}
