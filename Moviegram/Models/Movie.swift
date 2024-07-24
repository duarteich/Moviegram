//
//  Movie.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let posterPath: String
    let genreIds: [Int]
    let overview: String
    let popularity: Double
    let releaseDate: String
    let voteAverage: Double
}
