//
//  MusicTableViewCell.swift
//  iTune Music
//
//  Created by bhavesh on 06/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

protocol MusicTableViewCellProtocol: class {
    func detailTap(at indexPath: IndexPath)
}

class MusicTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var likeImageView: UIImageView!
    
    //MARK:- Memeber Properties
    var indexPath: IndexPath?
    weak var delegate: MusicTableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with music: Music, indexPath: IndexPath) {
        self.indexPath = indexPath
        
        if let trackName = music.trackName {
            trackNameLabel.text = trackName
        } else {
            trackNameLabel.text = StringConstants.PLACEHOLDER_TEXT
        }

        if let artistName = music.artistName {
            artistNameLabel.text = artistName
        } else {
            artistNameLabel.text = StringConstants.PLACEHOLDER_TEXT
        }

        if let artworkImagePath = music.artworkUrl {
            artworkImageView.downloadImage(at: artworkImagePath, placeholder: AppImages.music.instance)
        } else {
            artworkImageView.image = AppImages.music.instance
        }

        if music.isLiked {
            likeImageView.isHidden = false
            likeImageView.image = AppImages.liked.instance
        } else {
            likeImageView.isHidden = true
            likeImageView.image = AppImages.like.instance
        }

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }

    @IBAction func detailClicked(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        delegate?.detailTap(at: indexPath)
    }
    
}
