//
//  ViewAlbumTableViewCell.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

protocol ViewAlbumTableViewCellProtocol: class {
    func viewAlbumTaped()
}

class ViewAlbumTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var viewAlbumImageView: UIImageView!
    @IBOutlet weak var viewAlbumLabel: UILabel!

    //MARK:- Memeber Properties
    weak var delegate: ViewAlbumTableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func viewAlbumClicked(_ sender: UIButton) {
        delegate?.viewAlbumTaped()
    }
    
}
