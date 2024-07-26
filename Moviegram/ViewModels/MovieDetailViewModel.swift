//
//  MovieDetailViewModel.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    @Published var movieDetails: MovieDetails?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let movieRepository: MovieRepositoryProtocol
    
    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        self.movieRepository = movieRepository
    }
    
    func fetchMovieDetails(movieId: Int) {
        isLoading = true
        Task {
            do {
                self.movieDetails = try await movieRepository.fetchMovieDetails(movieId: movieId)
            } catch {
                self.errorMessage = error.localizedDescription
            }
            self.isLoading = false
        }
    }
}
