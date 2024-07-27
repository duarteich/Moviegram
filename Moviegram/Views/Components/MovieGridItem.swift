//
//  MovieGridItem.swift
//  Moviegram
//
//  Created by Christyan Duarte on 25/07/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieGridItem: View {
    @EnvironmentObject var sessionManager: SessionManager
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: URL(string: getPosterImageUrl()))
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 225)
                .clipped()
                .cornerRadius(8)
            
            Text(movie.title)
                .font(.headline)
                .lineLimit(1)
                .padding([.top], 8)
                .padding([.horizontal], 4)
        }
        .frame(width: 150)
    }
    
    func getPosterImageUrl() -> String {
        guard let imagesConfiguration = sessionManager.configuration?.images,
              imagesConfiguration.posterSizes.count > 2 else {
            return ""
        }
        let posterSize = imagesConfiguration.posterSizes[2]
        return "\(imagesConfiguration.secureBaseUrl)\(posterSize)\(movie.posterPath)"
    }
}

#Preview {
    MovieGridItem(
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
    .previewLayout(.sizeThatFits)
    .padding()
}

