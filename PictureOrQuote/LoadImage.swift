//
//  LoadImage.swift
//  PictureOrQuote
//
//  Created by Алена on 20.01.2022.
//

import UIKit

extension UIImageView {
    func loadImage(imageString: String) {
        guard let url = URL(string: imageString) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
