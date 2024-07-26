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
    @StateObject var viewModel = MovieDetailViewModel()
    let movieId: Int
    
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
                    .navigationTitle(viewModel.movieDetails?.title ?? "")
                }
            } else {
                Text("No Details available.")
                    .padding()
            }
        }
        .onAppear {
            if viewModel.movieDetails == nil {
                viewModel.fetchMovieDetails(movieId: movieId)
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
    MovieDetailView(movieId: 519182)
}
