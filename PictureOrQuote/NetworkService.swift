//
//  NetworkService.swift
//  PictureOrQuote
//
//  Created by Алена on 19.01.2022.
//

import Foundation

final class NetworkService {
    
    let decoder = JSONDecoder()
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    func baseRequest<T: Decodable> (request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        let handler: Handler = { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                    return
                }
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    if let error = print("data nil") as? Error {
                        completion(.failure(error))
                    }
                }
                return
            }
            do {
                let model = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(model))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        URLSession.shared.dataTask(with: request, completionHandler: handler).resume()
    }
}
