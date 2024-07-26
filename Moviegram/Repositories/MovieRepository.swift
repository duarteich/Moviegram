//
//  MovieRepository.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation

protocol MovieRepositoryProtocol {
    func fetchPopularMovies() async throws -> MovieResponse
    func fetchNowPlayingMovies() async throws -> MovieResponse
    func fetchMovieDetails(movieId: Int) async throws -> Movie
}

class MovieRepository: MovieRepositoryProtocol {
    private let apiClient: APIClient
    private let baseURL = Constants.API.baseURL
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func fetchPopularMovies() async throws -> MovieResponse {
        let endpoint = "\(baseURL)\(Constants.Endpoints.popularMovies)"
        return try await apiClient.fetch(endpoint: endpoint)
    }
    
    func fetchNowPlayingMovies() async throws -> MovieResponse {
        let endpoint = "\(baseURL)\(Constants.Endpoints.nowPlayingMovies)"
        return try await apiClient.fetch(endpoint: endpoint)
    }
    
    func fetchMovieDetails(movieId: Int) async throws -> Movie {
        let endpoint = "\(baseURL)\(Constants.Endpoints.movieDetails)/\(movieId)"
        return try await apiClient.fetch(endpoint: endpoint)
    }
}
