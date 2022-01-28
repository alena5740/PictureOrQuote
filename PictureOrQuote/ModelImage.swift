//
//  ModelImage.swift
//  PictureOrQuote
//
//  Created by Алена on 19.01.2022.
//

import Foundation

struct ModelImage {
    let imageString: String?
}

struct ModelImageListed: Codable {
    let file: String
}
