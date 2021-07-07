//
//  AppImages.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

enum AppImages: String {
    case music
    case more
    case like
    case liked
    case album
    case artist

    var instance: UIImage? {
        return UIImage(named: rawValue)
    }
}
