//
//  ViewController.swift
//  iTune Music
//
//  Created by bhavesh on 06/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- IBOutlets


    //MARK:- Member Properties


    //MARK:- ViewController Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    fileprivate func initialViewSetup() {
        self.title = ""
    }


}



extension ViewController : UITableViewDataSource {

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.allSongDetail.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tblView.dequeueReusableCell(withIdentifier: "SongTVCell", for: indexPath) as! SongTVCell
//        cell.confiCell(data: self.allSongDetail[indexPath.row])
//        return cell
//    }

}

extension ViewController : UITableViewDelegate {

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let url = URL(string: self.allSongDetail[indexPath.row].trackViewUrl ?? "")
//        if let  songUrl = url  {
//            let player = AVPlayer(url: songUrl)
//            let playerViewController = AVPlayerViewController()
//            playerViewController.player = player
//            self.present(playerViewController, animated: true) {
//                playerViewController.player!.play()
//            }
//        }
    }

}
