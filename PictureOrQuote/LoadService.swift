//
//  LoadService.swift
//  PictureOrQuote
//
//  Created by Алена on 19.01.2022.
//

import Foundation

protocol LoadServiceProtocol: AnyObject {
    func loadImage(completion: @escaping (Result<ModelImageListed, Error>) -> Void)
    func loadQuoteEnglish(completion: @escaping (Result<ModelQuoteEnglishListed, Error>) -> Void)
    func loadQuoteRussian(quote: String, completion: @escaping (Result<ModelQuoteRussianListed, Error>) -> Void)
}

final class LoadService: LoadServiceProtocol {
    
    let networkService = NetworkService()
    
    func loadImage(completion: @escaping (Result<ModelImageListed, Error>) -> Void) {
        let urlString = "https://aws.random.cat/meow"
        makeRequest(urlString: urlString, completion: completion)
    }
    
    private func makeRequest<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        networkService.baseRequest(request: request, completion: completion)
    }
    
    func loadQuoteEnglish(completion: @escaping (Result<ModelQuoteEnglishListed, Error>) -> Void) {
        let urlString = "https://favqs.com/api/qotd"
        makeRequest(urlString: urlString, completion: completion)
    }
    
    func loadQuoteRussian(quote: String, completion: @escaping (Result<ModelQuoteRussianListed, Error>) -> Void) {
        let quoteForURL = quote.changeStringForURLString()
        let urlString = "https://fasttranslator.herokuapp.com/api/v1/text/to/text?source=\(quoteForURL)&lang=en-ru"
        makeRequest(urlString: urlString, completion: completion)
    }
}
