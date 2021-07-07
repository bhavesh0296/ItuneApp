//
//  ViewController.swift
//  iTune Music
//
//  Created by bhavesh on 06/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var musicTableView: UITableView!

    //MARK:- Member Properties
    var presenter: HomePresenter!
    var musicList: [Music] = []

    //MARK:- ViewController Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HomePresenter(delegate: self)
        presenter.fetchMusic()
        initialViewSetup()
        tableViewSetup()
    }

    fileprivate func initialViewSetup() {
        self.title = StringConstants.HOME_SCREEN_TITLE
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    fileprivate func tableViewSetup() {
        musicTableView.delegate = self
        musicTableView.dataSource = self
        musicTableView.register(UINib(nibName: String(describing: MusicTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MusicTableViewCell.self))
        musicTableView.estimatedRowHeight = 80
        musicTableView.rowHeight = UITableView.automaticDimension
        reloadMusicTable()
    }

    fileprivate func reloadMusicTable() {
        DispatchQueue.main.async { [unowned self] in
            self.musicTableView.reloadData()
        }
    }

    fileprivate func getMusic(at index: Int) -> Music? {
        guard self.musicList.count > index else {
            return nil
        }
        return self.musicList[index]
    }

//    fileprivate func musicSelected(index: Int) {
//        guard self.musicList.count > index else {
//            showErrorAlert(StringConstants.APP_NAME, with: StringConstants.MUSIC_PREVIEW_ERROR_MESSAGE)
//            return
//        }
//        let music = self.musicList[index]
//        playMusicPreview(with: music)
//    }

    fileprivate func playMusicPreview(with music: Music) {
        guard let previewUrlPath = music.previewUrl,
            let previewUrl = URL(string: previewUrlPath)
            else {
                showErrorAlert(StringConstants.APP_NAME, with: StringConstants.MUSIC_PREVIEW_ERROR_MESSAGE)
                return
        }

        let player = AVPlayer(url: previewUrl)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.setBackgroundColor(color: AppColor.background)

        self.present(playerViewController, animated: true) {
            if let artworkUrl = music.artworkUrl {
                playerViewController.setMusicThumbnail(with: artworkUrl, placeholder: AppImages.music.instance)
            }
            playerViewController.player?.play()
        }
    }

}

//MARK:- UITableViewDataSource Extension
extension ViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MusicTableViewCell.self), for: indexPath) as! MusicTableViewCell
        let music = musicList[indexPath.row]
        cell.configure(with: music, index: indexPath.row)
        cell.delegate = self
        return cell
    }

}

//MARK:- UITableViewDelegate Extension
extension ViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}

//MARK:- HomePresenterProtocol Extension
extension ViewController: HomePresenterProtocol {

    func fetchMusicSuccess(with musicList: [Music]) {
        self.musicList = musicList
        self.reloadMusicTable()
    }

    func fetchMusicFailure(with message: String) {
        self.showErrorAlert(StringConstants.APP_NAME, with: message)
    }

    func showLoader() {

    }

    func hideLoader() {

    }

}

//MARK:- MusicTableViewCellProtocol Extension
extension ViewController: MusicTableViewCellProtocol {

    func previewTap(index: Int) {
        guard let music = self.getMusic(at: index) else {
            self.showErrorAlert(StringConstants.APP_NAME, with: StringConstants.MUSIC_GET_ERROR_AT_INDEX)
            return
        }
        self.playMusicPreview(with: music)
    }
}
