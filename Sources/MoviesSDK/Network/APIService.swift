//
//  APIService.swift
//  MoviesSDKApp
//
//  Created by lucas.henrique.costa on 22/03/21.
//

import Foundation

protocol Service {
    var basePath: String { get }
    var endpoint: String { get }
    var apiKey: String { get }
    var fullURL: URL? { get }
}

enum APIService: Service {
    
    case movie
    case genre
    
    var basePath: String {
        "api.themoviedb.org/3"
    }
    
    var endpoint: String {
        switch self {
        case .movie:
            return "/movie/popular"
        case .genre:
            return "/genre/movie/list"
        }
    }
    
    var apiKey: String {
        return "10983a66b000b2b0daf1d3e468679f5c"
    }
    
    var queryItems: [URLQueryItem] {
        
        var items = [URLQueryItem(name: "api_key", value: apiKey),
                     URLQueryItem(name: "language", value: "en-US")]
        
        switch self {
        case .movie:
            items.append(URLQueryItem(name: "page", value: "1"))
            return items
        case .genre:
            return items
        }
    }
    
    var fullURL: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.path = basePath + endpoint
        components.queryItems = queryItems
        return components.url
    }
}
