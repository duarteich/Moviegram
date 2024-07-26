//
//  APIClient.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    
    func fetch<T: Decodable>(endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer \(Constants.API.apiKey)"
        ]
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            guard (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}
