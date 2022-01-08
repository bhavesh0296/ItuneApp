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
    @IBOutlet weak var searchResultLabel: UILabel!

    //MARK:- Member Properties
    var presenter: HomePresenter!
    var musicList: [Music] = []
    var searchController = UISearchController()

    //MARK:- ViewController Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HomePresenter(delegate: self)
        updateSearchLabel(with: "Please Search Music")
        initialViewSetup()
        tableViewSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

    fileprivate func initialViewSetup() {
        self.title = StringConstants.HOME_SCREEN_TITLE
        self.navigationController?.navigationBar.tintColor = AppColor.theme
        self.navigationItem.searchController = searchController
        searchController.searchBar.setValue("Search", forKey: "cancelButtonText")
        searchController.delegate = self
        searchController.searchBar.delegate = self
        DispatchQueue.main.async {
            UIView.performWithoutAnimation {
                self.searchController.isActive = true
            }
        }
    }

    fileprivate func tableViewSetup() {
        musicTableView.delegate = self
        musicTableView.dataSource = self
        musicTableView.register(UINib(nibName: String(describing: MusicTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MusicTableViewCell.self))
        musicTableView.estimatedRowHeight = 80
        musicTableView.rowHeight = UITableView.automaticDimension
        musicTableView.tableFooterView = UIView()
        reloadMusicTable()
    }

    fileprivate func reloadMusicTable() {
        DispatchQueue.main.async { [unowned self] in
            self.musicTableView.reloadData()
        }
    }

    fileprivate func updateSearchLabel(with text: String) {
        DispatchQueue.main.async {
            self.searchResultLabel.text = text
        }
    }

    fileprivate func reloadRow(at indexPath: IndexPath) {
        self.musicTableView.reloadRows(at: [indexPath], with: .automatic)
    }

    fileprivate func getMusic(at index: Int) -> Music? {
        guard self.musicList.count > index else {
            return nil
        }
        return self.musicList[index]
    }

    fileprivate func musicTap(with index: Int) {
        guard let music = self.getMusic(at: index) else {
            self.showErrorAlert(StringConstants.APP_NAME, with: StringConstants.MUSIC_GET_ERROR_AT_INDEX)
            return
        }
        self.playMusicPreview(with: music)
    }

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
        if !music.isContainVideo {
            playerViewController.setBackgroundColor(color: AppColor.background)
        }

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            self.present(playerViewController, animated: true) {
                if !music.isContainVideo,
                    let artworkUrl = music.artworkUrl {
                    playerViewController.setMusicThumbnail(with: artworkUrl, placeholder: AppImages.music.instance)
                }
                playerViewController.player?.play()
            }
        }
    }

    fileprivate func navigateToMusicDetail(with music: Music, at indexPath: IndexPath) {
        let musicDetailVC = AppStoryboard.Main.getViewController(MusicDetailViewController.self)
        musicDetailVC.modalPresentationStyle = .overCurrentContext
        musicDetailVC.modalTransitionStyle = .coverVertical
        musicDetailVC.music = music
        musicDetailVC.musicIndexPath = indexPath
        musicDetailVC.delegate = self
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.present(musicDetailVC, animated: true, completion: nil)
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
        cell.configure(with: music, indexPath: indexPath)
        cell.delegate = self
        return cell
    }

}

//MARK:- UITableViewDelegate Extension
extension ViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.musicTap(with: indexPath.row)
    }

}

//MARK:- HomePresenterProtocol Extension
extension ViewController: HomePresenterProtocol {
    func fetchMusicSuccess(with musicList: [Music], text: String) {
        self.musicList = musicList

        if musicList.isEmpty {
            updateSearchLabel(with: "No Result Found for: \(text)")
        } else {
            updateSearchLabel(with: "Music Search For: \(text)")
        }
        self.reloadMusicTable()
    }

    func fetchMusicFailure(with message: String) {
        self.showErrorAlert(StringConstants.APP_NAME, with: message)
    }

    func showLoader() {
        LoaderUtility.shared.showLoader()
    }

    func hideLoader() {
        LoaderUtility.shared.hideLoader()
    }

}

//MARK:- MusicTableViewCellProtocol Extension
extension ViewController: MusicTableViewCellProtocol {

    func detailTap(at indexPath: IndexPath) {
        guard let music = self.getMusic(at: indexPath.row) else {
            self.showErrorAlert(StringConstants.APP_NAME, with: StringConstants.MUSIC_GET_ERROR_AT_INDEX)
            return
        }
        self.navigateToMusicDetail(with: music, at: indexPath)
    }

}

//MARK:- MusicDetailViewControllerProtocol extension
extension ViewController: MusicDetailViewControllerProtocol {

    func likeEvent(with music: Music, indexPath: IndexPath) {
        guard self.musicList.count > indexPath.row else {
            return
        }
        self.musicList[indexPath.row] = music

        self.reloadRow(at: indexPath)
    }

}

extension ViewController: UISearchControllerDelegate, UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        guard let text = searchBar.text else { return }
        presenter.fetchMusic(with: text)
    }
}
