//
//  MovieListView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var favoriteMoviesManager = FavoriteMoviesManager()
    
    var body: some View {
        TabView {
            PopularMoviesView()
                .tabItem {
                    Label("Popular", systemImage: "star.fill")
                }
            NowPlayingMoviesView()
                .tabItem {
                    Label("Now Playing", systemImage: "play.circle.fill")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
        .environmentObject(favoriteMoviesManager)
    }
}

#Preview {
    ContentView()
}
