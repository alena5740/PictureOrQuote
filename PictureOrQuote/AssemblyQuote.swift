//
//  AssemblyQuote.swift
//  PictureOrQuote
//
//  Created by Алена on 24.01.2022.
//

import UIKit

protocol AssemblyQuoteProtocol: AnyObject {
    func pushToViewControllerQuote() -> UIViewController
}

final class AssemblyQuote: AssemblyQuoteProtocol {
    func pushToViewControllerQuote() -> UIViewController {
        let presenter = Presenter(loadService: LoadService())
        let viewController = ViewControllerQuote(presenter: presenter)
        viewController.presenterQuote = presenter
        presenter.delegatPresenter = viewController
        
        return viewController
    }
}
