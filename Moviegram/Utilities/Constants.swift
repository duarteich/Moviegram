//
//  Constants.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation

struct Constants {
    struct API {
        static let apiKey = "YOUR_API_KEY"
        static let baseURL = "https://api.themoviedb.org/3"
    }
    
    struct Endpoints {
        static let configuration = "/configuration"
        static let popularMovies = "/movie/popular"
        static let nowPlayingMovies = "/movie/now_playing"
        static let movieDetails = "/movie"
    }
    
    struct UI {
        static let popularMoviesTitle = "Popular"
        static let nowPlayingMoviesTitle = "Now Playing"
        static let favoritesTitle = "Favorites"
    }
}
