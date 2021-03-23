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
    
    private let genreRepository: GenreRepository
    private let movieRepository: MovieRepository
    
    init(genreRepository: GenreRepository = GenreRepository(),
         movieRepository: MovieRepository = MovieRepository()) {
        self.genreRepository = genreRepository
        self.movieRepository = movieRepository
    }
    
    public func getPopularMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        movieRepository.getPopularMovies(completionHandler: completionHandler)
    }
    
    public func getGenresList(completionHandler: @escaping (Result<GenreResponse, Error>) -> Void) {
        genreRepository.getGenresList(completionHandler: completionHandler)
    }
}
