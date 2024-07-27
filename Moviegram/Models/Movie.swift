//
//  Movie.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation

struct MoviesResponse: Codable {
    let page: Int
    let results: [Movie]
}

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    let popularity: Double
    let releaseDate: String
    let voteAverage: Double
    
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath
        case overview
        case popularity
        case releaseDate
        case voteAverage
    }
}
