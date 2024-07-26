//
//  MovieListView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import SwiftUI

struct MovieListView: View {
    var body: some View {
        NavigationStack {
            TabView {
                PopularMoviesView()
                    .tabItem {
                        Label("Popular", systemImage: "star.fill")
                    }
                
                NowPlayingMoviesView()
                    .tabItem {
                        Label("Now Playing", systemImage: "play.circle.fill")
                    }
            }
            .navigationTitle(Constants.UI.movieListTitle)
        }
    }
}

#Preview {
    MovieListView()
}
