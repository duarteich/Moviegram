//
//  SessionManager.swift
//  Moviegram
//
//  Created by Christyan Duarte on 25/07/24.
//

import Foundation

@MainActor
class SessionManager: ObservableObject {
    @Published var configuration: Configuration?
    
    private let configurationRepository: ConfigurationRepositoryProtocol
    
    init(configurationRepository: ConfigurationRepositoryProtocol = ConfigurationRepository()) {
        self.configurationRepository = configurationRepository
        fetchConfiguration()
    }
    
    func fetchConfiguration() {
        Task {
            do {
                self.configuration = try await configurationRepository.fetchConfiguration()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
