//
//  LikeTableViewCell.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

protocol LikeTableViewCellProtocol: class {
    func likeTaped()
}

class LikeTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!

    //MARK:- Memeber Properties
    weak var delegate: LikeTableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with music: Music) {

        if music.isLiked {
            likeImageView.image = AppImages.liked.instance
            likeLabel.text = StringConstants.LIKED_TEXT
        } else {
            likeImageView.image = AppImages.like.instance
            likeLabel.text = StringConstants.LIKE_TEXT
        }

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }

    @IBAction func likedClicked(_ sender: UIButton) {
        delegate?.likeTaped()
    }

}
