//
//  LoaderUtility.swift
//  iTune Music
//
//  Created by bhavesh on 08/01/22.
//  Copyright © 2022 Bhavesh. All rights reserved.
//

import ProgressHUD

class LoaderUtility {

    static let shared = LoaderUtility()

    init() {
        ProgressHUD.show("Loading...")
        ProgressHUD.animationType = .systemActivityIndicator
        ProgressHUD.colorHUD = .systemGray
        ProgressHUD.colorBackground = .lightGray
        ProgressHUD.colorAnimation = .black
        ProgressHUD.colorProgress = .black
        ProgressHUD.colorStatus = .label
    }

    func showLoader() {
        ProgressHUD.show()
    }

    func hideLoader() {
        ProgressHUD.dismiss()
    }
}
