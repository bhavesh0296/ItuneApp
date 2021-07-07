//
//  UIViewController+Extension.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

extension UIViewController {

    func showErrorAlert(_ title: String, with message: String) {
        DispatchQueue.main.async { [unowned self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: StringConstants.ALERT_OK, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
