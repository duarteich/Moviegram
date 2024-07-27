//
//  MovieGridView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 26/07/24.
//

import SwiftUI

struct MovieGridView: View {
    let movies: [Movie]
    @Binding var isFinished: Bool
    var loadMoreContent: () -> Void
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(movies, id: \.id) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieGridItem(movie: movie)
                    }
                }
                if !isFinished {
                    LoadingView()
                        .onAppear(perform: loadMoreContent)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MovieGridView(
        movies: [
            Movie(
                id: 519182,
                title: "Despicable Me 4",
                posterPath: "/3w84hCFJATpiCO5g8hpdWVPBbmq.jpg",
                overview: "Gru and Lucy and their girls — Margo, Edith and Agnes — welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Meanwhile, Gru faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run.",
                popularity: 3483.085,
                releaseDate: "2024-06-20",
                voteAverage: 7.241
            )
        ],
        isFinished: .constant(true),
        loadMoreContent: {}
    )
}
