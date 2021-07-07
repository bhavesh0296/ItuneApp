//
//  TrackDetailTableViewCell.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

class TrackDetailTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var topConstarint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
            self.topConstarint.constant = UIScreen.main.bounds.height / 5
    }

    func configure(with music: Music) {
        if let trackName = music.trackName {
            trackNameLabel.text = trackName
        } else {
            trackNameLabel.text = StringConstants.EMPTY_String
        }

        if let artistName = music.artistName {
            artistNameLabel.text = artistName
        } else {
            artistNameLabel.text = StringConstants.EMPTY_String
        }

        if let artworkImagePath = music.artworkUrl {
            artworkImageView.downloadImage(at: artworkImagePath, placeholder: AppImages.music.instance)
        } else {
            artworkImageView.image = AppImages.music.instance
        }

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }
}
