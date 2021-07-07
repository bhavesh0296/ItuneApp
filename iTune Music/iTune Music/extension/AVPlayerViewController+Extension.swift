//
//  AVPlayerViewController+Extension.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit
import AVKit

extension AVPlayerViewController {

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    func setMusicThumbnail(with path: String, placeholder: UIImage?) {
        if let contentOverlayViewUnwrap = self.contentOverlayView {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            imageView.downloadImage(at: path, placeholder: placeholder)
            imageView.center = contentOverlayViewUnwrap.center
            contentOverlayViewUnwrap.addSubview(imageView)
        }
    }

    func setBackgroundColor(color: UIColor) {
        self.contentOverlayView?.backgroundColor = color
        setNeedsStatusBarAppearanceUpdate()
    }


}
