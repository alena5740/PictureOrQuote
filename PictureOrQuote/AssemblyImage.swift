//
//  AssemblyImage.swift
//  PictureOrQuote
//
//  Created by Алена on 19.01.2022.
//

import UIKit

protocol AssemblyImageProtocol: AnyObject {
    func pushToViewControllerImage() -> UIViewController
}

final class AssemblyImage: AssemblyImageProtocol {

    func pushToViewControllerImage() -> UIViewController {
        let presenter = Presenter(loadService: LoadService())
        let viewController = ViewControllerImage(presenter: presenter)
        viewController.presenterImage = presenter
        presenter.delegatPresenter = viewController
        
        return viewController
    }
}
