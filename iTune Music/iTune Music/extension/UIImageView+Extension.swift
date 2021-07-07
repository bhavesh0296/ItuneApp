//
//  UIImageView+Extension.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloadImage(at path: String, placeholder: UIImage?) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self else { return }

            DispatchQueue.main.async {
                // when method calls place placeholder image
                self.image = placeholder
            }

            guard let url = URL(string: path),
                let data = try? Data(contentsOf: url),
                let imageData = UIImage(data: data) else {
                    DispatchQueue.main.async {

                        //put place holder image when image is not there
                        self.image = placeholder
                    }
                    return
            }
            DispatchQueue.main.async {
                self.image = imageData
            }
        }
    }
}
