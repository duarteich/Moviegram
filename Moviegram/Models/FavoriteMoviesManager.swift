//
//  FavoriteMoviesManager.swift
//  Moviegram
//
//  Created by Christyan Duarte on 26/07/24.
//

import SwiftUI

class FavoriteMoviesManager: ObservableObject {
    @Published var favoriteMovies: [Movie] = []
    private let favoritesKey = "favoriteMovies"
    
    init() {
        loadFavorites()
    }
    
    func saveFavorites() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favoriteMovies) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }
    
    func loadFavorites() {
        if let savedMovies = UserDefaults.standard.object(forKey: favoritesKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedMovies = try? decoder.decode([Movie].self, from: savedMovies) {
                favoriteMovies = loadedMovies
            }
        }
    }
    
    func toggleFavorite(movie: Movie) {
        if let index = favoriteMovies.firstIndex(where: { $0.id == movie.id }) {
            favoriteMovies.remove(at: index)
        } else {
            favoriteMovies.append(movie)
        }
        saveFavorites()
    }
    
    func isFavorite(movieId: Int) -> Bool {
        favoriteMovies.contains(where: { $0.id == movieId })
    }
}
