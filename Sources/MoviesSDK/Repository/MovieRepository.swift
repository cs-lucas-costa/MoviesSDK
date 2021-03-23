//
//  MovieRepository.swift
//  MoviesSDKApp
//
//  Created by lucas.henrique.costa on 22/03/21.
//

import Foundation

class MovieRepository {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getPopularMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        networkManager.request(type: MovieResponse.self,
                               service: APIService.movie,
                               completionHandler: completionHandler)
    }
}
