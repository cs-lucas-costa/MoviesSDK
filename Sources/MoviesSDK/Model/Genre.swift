//
//  Genre.swift
//  MoviesSDKApp
//
//  Created by lucas.henrique.costa on 22/03/21.
//

import Foundation

public struct GenreResponse: Decodable {
    let genres: [Genre]
}

public struct Genre: Decodable {
    let id: Int
    let name: String
}
