//
//  ViewControllerButtons.swift
//  PictureOrQuote
//
//  Created by Алена on 19.01.2022.
//

import UIKit

protocol ViewControllerButtonsProtocol: AnyObject {
    func pushToViewControllerImage()
    func pushToViewControllerQuote()
}

final class ViewControllerButtons: UIViewController {
    
    private let viewButtons = ViewButtons()
    private var assemblyImage: AssemblyImageProtocol
    private var assemblyQuote: AssemblyQuoteProtocol
    
    
    init(assemblyImage: AssemblyImageProtocol, assemblyQuote: AssemblyQuoteProtocol) {
        self.assemblyImage = assemblyImage
        self.assemblyQuote = assemblyQuote
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        viewButtons.delegatViewConrtrollerButtons = self
    }
  
    override func viewDidLayoutSubviews() {
        setupViewButtons()
    }
    
    private func setupViewButtons() {
        view.addSubview(viewButtons)
        viewButtons.frame = self.view.frame
    }
}

extension ViewControllerButtons: ViewControllerButtonsProtocol {
    func pushToViewControllerImage() {
        
        let viewControllerImage = assemblyImage.pushToViewControllerImage()
        self.navigationController?.pushViewController(viewControllerImage, animated: true)
    }
    
    func pushToViewControllerQuote() {
        let viewControllerQuote = assemblyQuote.pushToViewControllerQuote()
        self.navigationController?.pushViewController(viewControllerQuote, animated: true)
    }
}

