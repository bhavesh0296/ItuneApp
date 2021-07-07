//
//  ViewArtistTableViewCell.swift
//  iTune Music
//
//  Created by bhavesh on 08/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit


protocol ViewArtistTableViewCellProtocol: class {
    func viewArtistTaped()
}

class ViewArtistTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var viewArtistImageView: UIImageView!
    @IBOutlet weak var viewArtistLabel: UILabel!

    //MARK:- Memeber Properties
    weak var delegate: ViewArtistTableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func viewArtistClicked(_ sender: UIButton) {
           delegate?.viewArtistTaped()
       }
    
}
