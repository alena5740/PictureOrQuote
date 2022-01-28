//
//  ModelQuoteEnglish.swift
//  PictureOrQuote
//
//  Created by Алена on 22.01.2022.
//

import Foundation

struct ModelQuoteEnglish {
    let quoteEnglish: String?
    let author: String?
}

struct ModelQuoteEnglishListed: Codable {
    let quote: Quote
}

struct Quote: Codable {
    let author: String
    let body: String
}

