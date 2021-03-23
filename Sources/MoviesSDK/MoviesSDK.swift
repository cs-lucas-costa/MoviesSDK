//
//  File.swift
//  
//
//  Created by lucas.henrique.costa on 22/03/21.
//

import Foundation

public protocol MoviesSDK {
    func getPopularMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void)
    func getGenresList(completionHandler: @escaping (Result<GenreResponse, Error>) -> Void)
}

public final class MoviesSDKManager: MoviesSDK {
    
    var genreRepository: GenreRepository
    var movieRepository: MovieRepository
    var database: DatabaseProtocol
    
    public init() {
        self.genreRepository = GenreRepository()
        self.movieRepository = MovieRepository()
        self.database = Database()
    }
    
    public func getPopularMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        movieRepository.getPopularMovies(completionHandler: completionHandler)
    }
    
    public func getGenresList(completionHandler: @escaping (Result<GenreResponse, Error>) -> Void) {
        genreRepository.getGenresList(completionHandler: completionHandler)
    }
    
    public func getFavoriteMovies(completionHandler: @escaping (Result<[Movie], Error>) -> Void) {
        database.fetch(type: Movie.self, with: nil, and: []) { (result) in
            completionHandler(result)
        }
    }
    
    public func saveMovie(_ movie: Movie) {
        database.create(element: movie, completion: nil)
    }
    
    public func unsaveMovie(_ id: Int) {
        database.delete(type: Movie.self, id: id, completion: nil)
    }
    
}
