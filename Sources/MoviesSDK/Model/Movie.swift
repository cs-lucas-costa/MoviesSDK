//
//  Movie.swift
//  MoviesSDKApp
//
//  Created by lucas.henrique.costa on 22/03/21.
//

import Foundation

public struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
}

public struct Movie: Decodable {
    
    let id: Int
    let posterPath: String
    let title: String
    //Falta os gêneros
    let releaseDate: String
    let overview: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        overview = try container.decode(String.self, forKey: .overview)
        title = try container.decode(String.self, forKey: .title)
    }
    
}

extension Movie {
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case title = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
