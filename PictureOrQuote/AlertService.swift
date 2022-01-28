//
//  AlertService.swift
//  PictureOrQuote
//
//  Created by Алена on 25.01.2022.
//

import UIKit

class AlertService {
    class func showAlertError() {
        
        guard let topVC = UIApplication.topViewController() else { return }
        let alert = UIAlertController(title: "Ошибка", message: "Попробуйте позже", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            topVC.navigationController?.popToRootViewController(animated: true)
        }
        
        alert.addAction(alertAction)
        
        topVC.present(alert, animated: true, completion: nil)
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
