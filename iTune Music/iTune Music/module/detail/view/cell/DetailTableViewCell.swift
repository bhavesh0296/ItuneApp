//
//  DetailTableViewCell.swift
//  iTune Music
//
//  Created by bhavesh on 08/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailValue: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    //MARK:- Configure functions

    func configureTrack(with music: Music) {

        self.detailLabel.text = StringConstants.TRACK_TEXT
        self.detailValue.text = music.trackType

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }

    func configureGenre(with music: Music) {

        self.detailLabel.text = StringConstants.GENRE_TEXT
        self.detailValue.text = music.genre

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }

    func configureAlbum(with music: Music) {

        self.detailLabel.text = StringConstants.ALBUM_TEXT
        self.detailValue.text = music.albumName

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }

    func configureReleased(with music: Music) {

        self.detailLabel.text = StringConstants.RELEASED_TEXT
        self.detailValue.text = music.releaseFormattedDate

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }

    func configureCountry(with music: Music) {

        self.detailLabel.text = StringConstants.COUNTRY_TEXT
        self.detailValue.text = music.country

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }

    func configurePrice(with music: Music) {

        self.detailLabel.text = StringConstants.PRICE_TEXT
        self.detailValue.text = music.price

        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }
    
}
