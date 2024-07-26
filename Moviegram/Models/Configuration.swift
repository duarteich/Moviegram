//
//  Configuration.swift
//  Moviegram
//
//  Created by Christyan Duarte on 25/07/24.
//

import Foundation

struct Configuration: Codable {
    let images: ImagesConfiguration
}

struct ImagesConfiguration: Codable {
    let secureBaseUrl: String
    let posterSizes: [String]
}
