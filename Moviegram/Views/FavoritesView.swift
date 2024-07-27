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
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
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
                                ScrollView {
                                    LazyVGrid(columns: columns, spacing: 16) {
                                        ForEach(favoriteMoviesManager.favoriteMovies, id: \.id) { movie in
                                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                                MovieGridItem(movie: movie)
                                            }
                                        }
                                    }
                                    .padding()
                                }
                            } else {
                                List {
                                    ForEach(favoriteMoviesManager.favoriteMovies) { movie in
                                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                                            MovieRow(movie: movie)
                                        }
                                    }
                                }
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

