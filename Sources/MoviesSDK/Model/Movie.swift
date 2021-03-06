//
//  Movie.swift
//  MoviesSDKApp
//
//  Created by lucas.henrique.costa on 22/03/21.
//

import Foundation

public struct MovieResponse: Decodable {
    public let page: Int
    public let results: [Movie]
}

public struct Movie: Decodable {
    
    public let id: Int
    public let posterPath: String
    public let title: String
    public let overview: String
    public let releaseYear: Int

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        releaseYear = try container.decode(String.self, forKey: .releaseDate).convertToDate(component: .year)
        overview = try container.decode(String.self, forKey: .overview)
        title = try container.decode(String.self, forKey: .title)
    }
    
    public init(id: Int,
                title: String,
                posterPath: String,
                releaseYear: Int,
                overview: String) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.releaseYear = releaseYear
        self.overview = overview
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
