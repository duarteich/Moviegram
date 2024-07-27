//
//  PopularMoviesView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 25/07/24.
//

import SwiftUI

struct PopularMoviesView: View {
    @StateObject var viewModel = MovieListViewModel()
    @State private var isGridView = false
    
    var body: some View {
        VStack {
            if viewModel.isLoadingPopular {
                LoadingView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            } else {
                NavigationStack {
                    VStack {
                        if isGridView {
                            MovieGridView(movies: viewModel.popularMovies, isFinished: $viewModel.isPopularMoviesFinished) {
                                viewModel.fetchPopularMovies()
                            }
                        } else {
                            MovieListView(movies: viewModel.popularMovies, isFinished: $viewModel.isPopularMoviesFinished) {
                                viewModel.fetchPopularMovies()
                            }
                        }
                    }
                    .navigationTitle(Constants.UI.popularMoviesTitle)
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
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
