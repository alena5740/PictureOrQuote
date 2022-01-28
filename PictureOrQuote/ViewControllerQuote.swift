//
//  ViewControllerQuote.swift
//  PictureOrQuote
//
//  Created by Алена on 22.01.2022.
//

import UIKit

final class ViewControllerQuote: UIViewController {
    
    private let viewQuote = ViewQuote()
    var presenterQuote: PresenterProtocol?
    
    init(presenter: PresenterProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.presenterQuote = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        presenterQuote?.getDataQuoteEnglish()
    }
    
    override func viewDidLayoutSubviews() {
        setupViewQuote()
    }
    
    private func setupViewQuote() {
        view.addSubview(viewQuote)
        viewQuote.frame = self.view.frame
    }
}

extension ViewControllerQuote: OutputViewProtocol {
    func updateView() {
        if presenterQuote?.quoteIsReady ?? false {
            viewQuote.configure(quoteEnglish: presenterQuote?.quoteEnglishString ?? "",
                                author: presenterQuote?.authorString ?? "",
                                quoteRussian: presenterQuote?.quoteRussianString ?? "")
            return
        }
        AlertService.showAlertError()
    }
}
