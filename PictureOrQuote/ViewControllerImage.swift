//
//  ViewControllerImage.swift
//  PictureOrQuote
//
//  Created by Алена on 19.01.2022.
//

import UIKit

final class ViewControllerImage: UIViewController {
    
    let viewImage = ViewImage()
    var presenterImage: PresenterProtocol?
    
    init(presenter: PresenterProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.presenterImage = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        presenterImage?.getDataImage()
    }
    
    override func viewWillLayoutSubviews() {
        setupViewImage()
    }
    
    private func setupViewImage() {
        view.addSubview(viewImage)
        viewImage.frame = self.view.frame
    }
}

extension ViewControllerImage: OutputViewProtocol {
    func updateView() {
        if presenterImage?.imageIsReady ?? false  {
            viewImage.configure(imageStringURL: presenterImage?.modelImageString ?? "")
            return
        }
        AlertService.showAlertError()
    }
}
