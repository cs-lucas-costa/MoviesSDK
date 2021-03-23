//
//  NetworkManager.swift
//  MoviesSDKApp
//
//  Created by lucas.henrique.costa on 22/03/21.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case errorToDecode
}

protocol NetworkManagerProtocol {
    func request<Element: Decodable>(type: Element.Type,
                                     service: Service,
                                     completionHandler: @escaping (Result<Element, Error>) -> Void)
    
    func decode<Element:Decodable>(data: Data, with type: Element.Type) throws -> Element
}

extension NetworkManagerProtocol {
    public func decode<Element:Decodable>(data: Data, with type: Element.Type) throws -> Element {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
}


public final class NetworkManager: NetworkManagerProtocol {
    
    private let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request<Element: Decodable>(type: Element.Type,
                                     service: Service,
                                     completionHandler: @escaping (Result<Element, Error>) -> Void) {
    
        guard let url = service.fullURL else {
            completionHandler(.failure(NetworkError.badURL))
            return
        }
        
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode) else {
                completionHandler(.failure(NetworkError.badResponse))
                return
            }
            
            
            guard let data = data,
                  let element = try? self?.decode(data: data, with: type) else {
                completionHandler(.failure(NetworkError.errorToDecode))
                return
            }
            
            completionHandler(.success(element))
        }
        
        task.resume()
    }
    
}
