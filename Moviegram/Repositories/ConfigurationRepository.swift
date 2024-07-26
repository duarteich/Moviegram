//
//  ConfigurationRepository.swift
//  Moviegram
//
//  Created by Christyan Duarte on 25/07/24.
//

import Foundation

protocol ConfigurationRepositoryProtocol {
    func fetchConfiguration() async throws -> Configuration
}

class ConfigurationRepository: ConfigurationRepositoryProtocol {
    private let apiClient: APIClient
    private let baseURL = Constants.API.baseURL
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func fetchConfiguration() async throws -> Configuration {
        let endpoint = "\(baseURL)\(Constants.Endpoints.configuration)"
        return try await apiClient.fetch(endpoint: endpoint)
    }
}
