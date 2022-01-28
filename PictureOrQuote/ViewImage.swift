//
//  ViewImage.swift
//  PictureOrQuote
//
//  Created by Алена on 19.01.2022.
//

import UIKit

final class ViewImage: UIView {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageStringURL: String) {
        imageView.loadImage(imageString: imageStringURL)
    }
    
    private func setupImageView() {
        self.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        makeConstraintsImageView()
    }
    
    private func makeConstraintsImageView() {
        imageView.frame = CGRect(x: 0,
                                 y: (Constants.boundsDevices.height - Constants.boundsDevices.width) / 2,
                                 width: Constants.boundsDevices.width,
                                 height: Constants.boundsDevices.width)
    }
}
