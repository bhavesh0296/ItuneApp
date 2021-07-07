//
//  MusicTableViewCell.swift
//  iTune Music
//
//  Created by bhavesh on 06/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

protocol MusicTableViewCellProtocol: class {
    func previewTap(index: Int)
}

class MusicTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!

    //MARK:- Memeber Properties
    var index: Int?
    weak var delegate: MusicTableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with music: Music, index: Int) {
        self.index = index
        
        if let trackName = music.trackName,
            let artistName = music.artistName {
            trackNameLabel.text = trackName
            artistNameLabel.text = artistName
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

    @IBAction func previewClicked(_ sender: UIButton) {
        guard let index = index else { return }
        delegate?.previewTap(index: index)
    }

    
}
