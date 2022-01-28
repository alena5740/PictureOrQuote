//
//  Presenter.swift
//  PictureOrQuote
//
//  Created by Алена on 20.01.2022.
//

import Foundation

protocol OutputViewProtocol: AnyObject {
    func updateView()
}

protocol PresenterProtocol: AnyObject {
    func getDataImage()
    func getDataQuoteEnglish()
    func getDataQuoteRussian(quote: String)
    var modelImageString: String { get }
    var quoteEnglishString: String { get }
    var authorString: String { get }
    var quoteRussianString: String { get }
    var imageIsReady: Bool { get }
    var quoteIsReady: Bool { get }
}

final class Presenter: PresenterProtocol {
   
    let loadService: LoadServiceProtocol
    var modelImageString = ""
    var quoteEnglishString = ""
    var authorString = ""
    var quoteRussianString = ""
    var imageIsReady = false
    var quoteIsReady = false
    
    var delegatPresenter: OutputViewProtocol?
    
    init(loadService: LoadServiceProtocol) {
        self.loadService = loadService
    }
    
    func getDataImage() {
        loadService.loadImage { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.imageIsReady = true
                self.modelImageString = model.file
                self.delegatPresenter?.updateView()
            case .failure(_):
                self.imageIsReady = false
                self.delegatPresenter?.updateView()
                print("modelImage error")
            }
        }
    }
    
    func getDataQuoteEnglish() {
        loadService.loadQuoteEnglish { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(_):
                self.quoteIsReady = false
                self.delegatPresenter?.updateView()
                print("modelQuoteEnlish error")
            case .success(let model):
                self.quoteIsReady = true
                let quote = model.quote.body
                self.quoteEnglishString = quote
                self.authorString = model.quote.author
                self.getDataQuoteRussian(quote: quote)
                self.delegatPresenter?.updateView()
            }
        }
    }
    
    func getDataQuoteRussian(quote: String) {
        loadService.loadQuoteRussian(quote: quote) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                let quoteRU = model.data
                self.quoteRussianString = quoteRU.changeURLStringForString()
                self.delegatPresenter?.updateView()
            case .failure(_):
                print("modelQuoteRussian error")
            }
        }
    }
}
