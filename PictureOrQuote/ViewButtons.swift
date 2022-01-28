//
//  ViewButtons.swift
//  PictureOrQuote
//
//  Created by Алена on 19.01.2022.
//

import UIKit

final class ViewButtons: UIView {
    
    private let buttonNeedImage = UIButton()
    private let buttonNeedQuote = UIButton()
    
    weak var delegatViewConrtrollerButtons: ViewControllerButtonsProtocol?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupButtonNeedImage()
        setupButtonNeedQuote()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonNeedImage() {
        self.addSubview(buttonNeedImage)
        buttonNeedImage.backgroundColor = .systemOrange
        buttonNeedImage.setTitle("Хочу пикчу", for: .normal)
        buttonNeedImage.layer.cornerRadius = 15
        buttonNeedImage.addTarget(delegatViewConrtrollerButtons, action: #selector(buttonActionNeedImage), for: .touchDown)
        makeConstraintsButtonNeedImage()
    }
    
    @objc private func buttonActionNeedImage() {
        delegatViewConrtrollerButtons?.pushToViewControllerImage()
    }
    
    private func makeConstraintsButtonNeedImage() {
        buttonNeedImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonNeedImage.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.boundsDevices.height / 4),
            buttonNeedImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            buttonNeedImage.heightAnchor.constraint(equalToConstant: Constants.boundsDevices.height / 6),
            buttonNeedImage.widthAnchor.constraint(equalToConstant: Constants.boundsDevices.width - 32)
        ])
    }
    
    private func setupButtonNeedQuote() {
        self.addSubview(buttonNeedQuote)
        buttonNeedQuote.backgroundColor = .systemGreen
        buttonNeedQuote.setTitle("Хочу цитатку", for: .normal)
        buttonNeedQuote.layer.cornerRadius = 15
        buttonNeedQuote.addTarget(delegatViewConrtrollerButtons, action: #selector(buttonActionNeedQuote), for: .touchDown)
        makeConstraintsButtonNeedQuote()
    }
    
    @objc private func buttonActionNeedQuote() {
        delegatViewConrtrollerButtons?.pushToViewControllerQuote()
    }
    
    private func makeConstraintsButtonNeedQuote() {
        buttonNeedQuote.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonNeedQuote.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.boundsDevices.height / 2),
            buttonNeedQuote.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            buttonNeedQuote.heightAnchor.constraint(equalToConstant: Constants.boundsDevices.height / 6),
            buttonNeedQuote.widthAnchor.constraint(equalToConstant: Constants.boundsDevices.width - 32)
        ])
    }
}
