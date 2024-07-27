//
//  MovieDetails.swift
//  Moviegram
//
//  Created by Christyan Duarte on 26/07/24.
//

import Foundation

struct MovieDetails: Identifiable, Codable {
    let id: Int
    let title: String
    let posterPath: String
    let genres: [Genre]
    let overview: String
    let popularity: Double
    let releaseDate: String
    let spokenLanguages: [Language]
    let voteAverage: Double
    let status: String
    
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath
        case genres
        case overview
        case popularity
        case releaseDate
        case spokenLanguages
        case voteAverage
        case status
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}

struct Language: Codable {
    let iso6391: String
    let englishName: String
    let name: String
}
