//
//  Constants.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import Foundation

struct Constants {
    struct API {
        static let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzBhMjYxNGY4OGQzYmRjNzg2NGQ5Y2Q1Y2JmNDI3YSIsIm5iZiI6MTcyMTgwMTU1Ni4xNTg3MDUsInN1YiI6IjY2YTA5OTAzZjA2NDVmN2ZlNTQ5ZmE4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1UKx7ANUB99LUfabglDsxi9ayP7mxJrZnRIYa6J5t-0"
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
