//
//  UIView+Extension.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

extension UIView {

    func roundCorners(_ corners:UIRectCorner = .allCorners, radius: CGFloat) {
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }

    func addBlurToView(with alpha: CGFloat = 0.8) {
        if !UIAccessibility.isReduceTransparencyEnabled {
            var blurEffect: UIBlurEffect!
            blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.bounds
            blurEffectView.alpha = alpha
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            self.insertSubview(blurEffectView, at: 0)

        }
    }

    func removeBlurFromView() {
        for subview in self.subviews {
            if subview is UIVisualEffectView {
                subview.removeFromSuperview()
            }
        }
    }
}
