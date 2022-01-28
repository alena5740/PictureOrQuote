//
//  StringForURL.swift
//  PictureOrQuote
//
//  Created by Алена on 22.01.2022.
//

import Foundation

extension String {
    
    func changeStringForURLString() -> String {
        return self
            .components(separatedBy: " ")
            .filter { !$0.isEmpty }
            .joined(separator: "-")
    }
    
    func changeURLStringForString() -> String {
        return self
            .components(separatedBy: "-")
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}
