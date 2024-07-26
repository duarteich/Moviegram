//
//  MovieListViewModel.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var popularMovies: [Movie] = []
    @Published var nowPlayingMovies: [Movie] = []
    @Published var isLoadingPopular = false
    @Published var isLoadingNowPlaying = false
    @Published var errorMessage: String?
    
    private let movieRepository: MovieRepositoryProtocol
    
    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        self.movieRepository = movieRepository
    }
    
    func fetchPopularMovies() {
        isLoadingPopular = true
        Task {
            do {
                self.popularMovies = try await movieRepository.fetchPopularMovies().results
            } catch {
                self.errorMessage = error.localizedDescription
            }
            self.isLoadingPopular = false
        }
    }
    
    func fetchNowPlayingMovies() {
        isLoadingNowPlaying = true
        Task {
            do {
                self.nowPlayingMovies = try await movieRepository.fetchNowPlayingMovies().results
            } catch {
                self.errorMessage = error.localizedDescription
            }
            self.isLoadingNowPlaying = false
        }
    }
}
