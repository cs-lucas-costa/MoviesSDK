//
//  GenreRepository.swift
//  MoviesSDKApp
//
//  Created by lucas.henrique.costa on 22/03/21.
//

import Foundation

class GenreRepository {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getGenresList(completionHandler: @escaping (Result<GenreResponse, Error>) -> Void) {
        networkManager.request(type: GenreResponse.self,
                               service: APIService.genre,
                               completionHandler: completionHandler)
    }
}
