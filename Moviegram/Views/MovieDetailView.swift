//
//  MovieDetailView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @EnvironmentObject var favoriteMoviesManager: FavoriteMoviesManager
    @StateObject var viewModel = MovieDetailViewModel()
    let movie: Movie
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                LoadingView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            } else if let movieDetails = viewModel.movieDetails {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        WebImage(url: URL(string: getPosterImageUrl()))
                            .resizable()
                            .indicator(.activity)
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .cornerRadius(8)
                        Text("Genres")
                            .font(.headline)
                        Text(movieDetails.genres.map { $0.name }.joined(separator: ", "))
                            .font(.body)
                            .padding(.bottom, 8)
                        Text("Overview")
                            .font(.headline)
                        Text(movieDetails.overview)
                            .font(.body)
                            .padding(.bottom, 8)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Popularity")
                                    .font(.headline)
                                Text("\(movieDetails.popularity, specifier: "%.1f")")
                                    .font(.body)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Vote Average")
                                    .font(.headline)
                                Text("\(movieDetails.voteAverage, specifier: "%.1f")")
                                    .font(.body)
                            }
                        }
                        .padding(.bottom, 8)
                        VStack(alignment: .leading) {
                            Text("Release Date")
                                .font(.headline)
                            Text(movieDetails.releaseDate)
                                .font(.body)
                                .padding(.bottom, 8)
                            
                            Text("Languages")
                                .font(.headline)
                            Text(movieDetails.spokenLanguages.map { $0.name }.joined(separator: ", "))
                                .font(.body)
                                .padding(.bottom, 8)
                            
                            Text("Status")
                                .font(.headline)
                            Text(movieDetails.status)
                                .font(.body)
                        }
                    }
                    .padding()
                    .navigationTitle(movieDetails.title)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                viewModel.toggleFavorite()
                                favoriteMoviesManager.toggleFavorite(movie: movie)
                            }) {
                                Image(systemName: movieDetails.isFavorite ? "heart.fill" : "heart")
                            }
                        }
                    }
                }
            } else {
                Text("No Details available.")
                    .padding()
            }
        }
        .task {
            if viewModel.movieDetails == nil {
                await viewModel.fetchMovieDetails(movieId: movie.id)
                viewModel.updateFavorite(with: favoriteMoviesManager)
            }
        }
    }
    
    func getPosterImageUrl() -> String {
        guard let imagesConfiguration = sessionManager.configuration?.images,
              imagesConfiguration.posterSizes.count > 2,
              let posterPath = viewModel.movieDetails?.posterPath else {
            return ""
        }
        let posterSize = imagesConfiguration.posterSizes[3]
        return "\(imagesConfiguration.secureBaseUrl)\(posterSize)\(posterPath)"
    }
}

#Preview {
    MovieDetailView(
        movie: Movie(
            id: 519182,
            title: "Despicable Me 4",
            posterPath: "/3w84hCFJATpiCO5g8hpdWVPBbmq.jpg",
            overview: "Gru and Lucy and their girls — Margo, Edith and Agnes — welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Meanwhile, Gru faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run.",
            popularity: 3483.085,
            releaseDate: "2024-06-20",
            voteAverage: 7.241
        )
    )
        .environmentObject(SessionManager())
}
