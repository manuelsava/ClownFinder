//
//  NetworkManager.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    let reqUrl = "http://localhost:3000/clowns"
    
    private init() {}
    
    func getClowns() async throws -> [Clown] {
        
        guard let url = URL(string: reqUrl) else {
            throw APIError.genericError
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode([Clown].self, from: data)
            return decodedResponse
        } catch {
            throw APIError.genericError
        }
    }
}
