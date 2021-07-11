//
//  MusicDetailViewController.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

protocol MusicDetailViewControllerProtocol: class {
    func likeEvent(with music: Music, indexPath: IndexPath)
}

class MusicDetailViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!

    //MARK:- Member Properties
    var music: Music!
    var musicIndexPath: IndexPath!
    weak var delegate: MusicDetailViewControllerProtocol?

    //MARK:- ViewController Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initialViewSetup()
    }

    override func viewDidLayoutSubviews() {
        self.view.addBlurToView()
    }

    fileprivate func initialViewSetup() {
        closeButton.roundCorners(radius: 6.0)
    }

    fileprivate func tableViewSetup() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(UINib(nibName: String(describing: TrackDetailTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TrackDetailTableViewCell.self))
        detailTableView.register(UINib(nibName: String(describing: LikeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: LikeTableViewCell.self))
        detailTableView.register(UINib(nibName: String(describing: ViewAlbumTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ViewAlbumTableViewCell.self))
        detailTableView.register(UINib(nibName: String(describing: ViewArtistTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ViewArtistTableViewCell.self))
        detailTableView.register(UINib(nibName: String(describing: DetailTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DetailTableViewCell.self))
        detailTableView.estimatedRowHeight = 80
        detailTableView.rowHeight = UITableView.automaticDimension
        detailTableView.separatorStyle = .none
        detailTableView.tableFooterView = UIView()
        detailTableView.showsVerticalScrollIndicator = false
        detailTableView.showsHorizontalScrollIndicator = false
        reloadDetailTable()
    }

    fileprivate func reloadDetailTable() {
        DispatchQueue.main.async { [unowned self] in
            self.detailTableView.reloadData()
        }
    }

    fileprivate func reloadRow(at indexPath: IndexPath) {
        self.detailTableView.reloadRows(at: [indexPath], with: .automatic)
    }

    fileprivate func openUrl(with path: String) {
        guard let url = URL(string: path) else {
                showErrorAlert(StringConstants.APP_NAME, with: StringConstants.URL_INIT_ERROR)
                return
        }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    //MARK:- IBAction
    @IBAction func closeClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

//MARK:- UITableViewDataSource Extension
extension MusicDetailViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TrackDetailTableViewCell.self), for: indexPath) as! TrackDetailTableViewCell
            cell.configure(with: music)
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LikeTableViewCell.self), for: indexPath) as! LikeTableViewCell
            cell.configure(with: music)
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ViewAlbumTableViewCell.self), for: indexPath) as! ViewAlbumTableViewCell
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ViewArtistTableViewCell.self), for: indexPath) as! ViewArtistTableViewCell
            cell.delegate = self
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailTableViewCell.self), for: indexPath) as! DetailTableViewCell
            cell.configureTrack(with: music)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailTableViewCell.self), for: indexPath) as! DetailTableViewCell
            cell.configureGenre(with: music)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailTableViewCell.self), for: indexPath) as! DetailTableViewCell
            cell.configureAlbum(with: music)
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailTableViewCell.self), for: indexPath) as! DetailTableViewCell
            cell.configureReleased(with: music)
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailTableViewCell.self), for: indexPath) as! DetailTableViewCell
            cell.configureCountry(with: music)
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailTableViewCell.self), for: indexPath) as! DetailTableViewCell
            cell.configurePrice(with: music)
            return cell
        default:
            return UITableViewCell()
        }
    }

}

//MARK:- extension LikeTableViewCellProtocol
extension MusicDetailViewController: LikeTableViewCellProtocol {

    func likeTaped() {
        self.music.isLiked.toggle()
        delegate?.likeEvent(with: self.music, indexPath: self.musicIndexPath)
        self.dismiss(animated: true, completion: nil)
    }

}

//MARK:- extension ViewAlbumTableViewCellProtocol
extension MusicDetailViewController: ViewAlbumTableViewCellProtocol {

    func viewAlbumTaped() {
        guard let collectionViewPath = music.collectionViewUrl else {
            showErrorAlert(StringConstants.APP_NAME, with: StringConstants.ALBUM_VIEW_URL_ERROR)
            return
        }
        self.openUrl(with: collectionViewPath)
    }

}

//MARK:- extension ViewArtistTableViewCellProtocol
extension MusicDetailViewController: ViewArtistTableViewCellProtocol {

    func viewArtistTaped() {
        guard let artistViewPath = music.artistViewUrl else {
            showErrorAlert(StringConstants.APP_NAME, with: StringConstants.ARTIST_VIEW_URL_ERROR)
            return
        }
        self.openUrl(with: artistViewPath)
    }

}
