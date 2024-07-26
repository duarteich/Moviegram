//
//  MovieRepository.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation

protocol MovieRepositoryProtocol {
    func fetchPopularMovies() async throws -> MoviesResponse
    func fetchNowPlayingMovies() async throws -> MoviesResponse
    func fetchMovieDetails(movieId: Int) async throws -> MovieDetails
}

class MovieRepository: MovieRepositoryProtocol {
    private let apiClient: APIClient
    private let baseURL = Constants.API.baseURL
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    func fetchPopularMovies() async throws -> MoviesResponse {
        let endpoint = "\(baseURL)\(Constants.Endpoints.popularMovies)"
        return try await apiClient.fetch(endpoint: endpoint)
    }
    
    func fetchNowPlayingMovies() async throws -> MoviesResponse {
        let endpoint = "\(baseURL)\(Constants.Endpoints.nowPlayingMovies)"
        return try await apiClient.fetch(endpoint: endpoint)
    }
    
    func fetchMovieDetails(movieId: Int) async throws -> MovieDetails {
        let endpoint = "\(baseURL)\(Constants.Endpoints.movieDetails)/\(movieId)"
        return try await apiClient.fetch(endpoint: endpoint)
    }
}
