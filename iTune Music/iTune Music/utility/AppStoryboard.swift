//
//  AppStoryboard.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

enum AppStoryboard: String {

    case Main

    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }

    func getViewController<T: UIViewController>(_ ofType:T.Type) -> T {
        guard let viewController = instance.instantiateViewController(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Couldn't instantiate UIViewController for \(String(describing: ofType)), make sure the view conroller is presenter into the storyboard \(self.rawValue) and storyboard identifier is \(String(describing: ofType))")
        }
        return viewController
    }
}
