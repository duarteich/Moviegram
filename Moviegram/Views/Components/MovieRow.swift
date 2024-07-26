//
//  MovieRow.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import SwiftUI

struct MovieRow: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text("Popularity: \(movie.popularity, specifier: "%.1f")")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    MovieRow(
        movie: Movie(
            id: 519182,
            title: "Despicable Me 4",
            posterPath: "/3w84hCFJATpiCO5g8hpdWVPBbmq.jpg",
            genreIds: [16, 10751, 35, 28],
            overview: "Gru and Lucy and their girls — Margo, Edith and Agnes — welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Meanwhile, Gru faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run.",
            popularity: 3483.085,
            releaseDate: "2024-06-20",
            voteAverage: 7.241
        )
    )
    .previewLayout(
        .sizeThatFits
    )
    .padding()
}
