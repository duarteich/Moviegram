//
//  PopularMoviesView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 25/07/24.
//

import SwiftUI

struct PopularMoviesView: View {
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoadingPopular {
                LoadingView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            } else {
                List(viewModel.popularMovies) { movie in
                    NavigationLink(destination: MovieDetailView()) {
                        MovieRow(movie: movie)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear {
            if viewModel.popularMovies.isEmpty {
                viewModel.fetchPopularMovies()
            }
        }
    }
}

#Preview {
    PopularMoviesView()
}
