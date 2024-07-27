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
                    Group {
                        if isGridView {
                            MovieGridView(movies: viewModel.popularMovies)
                        } else {
                            MovieListView(movies: viewModel.popularMovies)
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
        .task {
            if viewModel.popularMovies.isEmpty {
                await viewModel.fetchPopularMovies()
            }
        }
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
