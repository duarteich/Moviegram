//
//  MovieListViewModel.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation
import SwiftUI

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var popularMovies: [Movie] = []
    @Published var nowPlayingMovies: [Movie] = []
    @Published var isLoadingPopular = false
    @Published var isLoadingNowPlaying = false
    @Published var errorMessage: String?
    
    @Published var isPopularMoviesFinished = false
    @Published var isNowPlayingMoviewFinished = false
    
    private var popularMoviesPage = 1
    private var popularMoviesTotalPages = 0
    
    private var nowPlayingMoviesPage = 1
    private var nowPlayingMoviesTotalPages = 0
    
    private let movieRepository: MovieRepositoryProtocol
    
    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        self.movieRepository = movieRepository
    }
    
    func fetchPopularMovies() {
        if popularMoviesPage == popularMoviesTotalPages {
            isPopularMoviesFinished = true
            return
        }
        isLoadingPopular = true
        Task {
            do {
                let data = try await movieRepository.fetchPopularMovies(page: popularMoviesPage)
                self.popularMovies += data.results
                self.popularMoviesTotalPages = data.totalPages
                self.popularMoviesPage += 1
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
                let data = try await movieRepository.fetchNowPlayingMovies(page: nowPlayingMoviesPage)
                self.nowPlayingMovies = data.results
                self.nowPlayingMoviesTotalPages = data.totalPages
                if nowPlayingMoviesPage == nowPlayingMoviesTotalPages {
                    isNowPlayingMoviewFinished = true
                } else {
                    nowPlayingMoviesPage += 1
                }
            } catch {
                self.errorMessage = error.localizedDescription
            }
            self.isLoadingNowPlaying = false
        }
    }
}
