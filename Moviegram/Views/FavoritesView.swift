//
//  FavoritesView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 26/07/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoriteMoviesManager: FavoriteMoviesManager
    @State private var isGridView = false

    var body: some View {
        NavigationStack {
            Group {
                if favoriteMoviesManager.favoriteMovies.isEmpty {
                    Text("No favorites yet.")
                        .foregroundColor(.gray)
                } else {
                    NavigationStack {
                        Group {
                            if isGridView {
                                MovieGridView(movies: favoriteMoviesManager.favoriteMovies)
                            } else {
                                MovieListView(movies: favoriteMoviesManager.favoriteMovies)
                            }
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                HStack {
                                    Button(action: {
                                        isGridView = false
                                    }) {
                                        Image(systemName: "list.bullet")
                                    }
                                    Button(action: {
                                        isGridView = true
                                    }) {
                                        Image(systemName: "square.grid.2x2")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(Constants.UI.favoritesTitle)
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoriteMoviesManager())
}

