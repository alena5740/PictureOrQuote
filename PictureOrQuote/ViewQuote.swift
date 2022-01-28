//
//  ViewQuote.swift
//  PictureOrQuote
//
//  Created by Алена on 22.01.2022.
//

import UIKit

final class ViewQuote: UIView {
    
    private let quoteEnglish = UILabel()
    private let quoteRussian = UILabel()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupQuoteEnglish()
        setupQuoteRussian()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupQuoteEnglish() {
        self.addSubview(quoteEnglish)
        quoteEnglish.textColor = .black
        quoteEnglish.numberOfLines = 0
        makeConstraintsQuoteEnglish()
    }
    
    private func makeConstraintsQuoteEnglish() {
        quoteEnglish.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quoteEnglish.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            quoteEnglish.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.boundsDevices.height / 4),
            quoteEnglish.widthAnchor.constraint(equalToConstant: Constants.boundsDevices.width - 32)
        ])
    }
    
    private func setupQuoteRussian() {
        self.addSubview(quoteRussian)
        quoteRussian.textColor = .black
        quoteRussian.numberOfLines = 0
        makeConstraintsQuoteRussian()
    }
    
    private func makeConstraintsQuoteRussian() {
        quoteRussian.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quoteRussian.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            quoteRussian.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.boundsDevices.height / 2),
            quoteRussian.widthAnchor.constraint(equalToConstant: Constants.boundsDevices.width - 32)
        ])
    }
    
    func configure(quoteEnglish: String, author: String, quoteRussian: String) {
        self.quoteEnglish.text = "\(quoteEnglish)\n"
            + " \n"
            + "\(author)"
        
        if !quoteRussian.isEmpty {
            self.quoteRussian.text = "\(quoteRussian)\n"
                + " \n"
                + "\(author)"
        }
    }
}






