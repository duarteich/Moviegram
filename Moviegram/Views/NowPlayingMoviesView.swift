//
//  NowPlayingMoviesView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 25/07/24.
//

import SwiftUI

struct NowPlayingMoviesView: View {
    @StateObject var viewModel = MovieListViewModel()
    @State private var isGridView = false
    
    var body: some View {
        VStack {
            if viewModel.isLoadingNowPlaying {
                LoadingView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            } else {
                NavigationStack {
                    Group {
                        if isGridView {
                            MovieGridView(movies: viewModel.nowPlayingMovies)
                        } else {
                            MovieListView(movies: viewModel.nowPlayingMovies)
                        }
                    }
                    .navigationTitle(Constants.UI.nowPlayingMoviesTitle)
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
