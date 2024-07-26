//
//  NowPlayingMoviesView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 25/07/24.
//

import SwiftUI

struct NowPlayingMoviesView: View {
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoadingNowPlaying {
                LoadingView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            } else {
                List(viewModel.nowPlayingMovies) { movie in
                    NavigationLink(destination: MovieDetailView()) {
                        MovieRow(movie: movie)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear {
            if viewModel.nowPlayingMovies.isEmpty {
                viewModel.fetchNowPlayingMovies()
            }
        }
    }
}

#Preview {
    NowPlayingMoviesView()
}
