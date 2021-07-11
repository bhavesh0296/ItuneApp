//
//  HomePresenter.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol: class {
    func fetchMusicSuccess(with musicList: [Music])
    func fetchMusicFailure(with message: String)
    func showLoader()
    func hideLoader()
}

class HomePresenter {

    //MARK:- Member Properties
    weak var delegate: HomePresenterProtocol?

    //MARK:- Initializer
    init(delegate: HomePresenterProtocol) {
        self.delegate = delegate
    }

    func fetchMusic() {
        delegate?.showLoader()
        APIService.shared.getRequest(.searchMichaelJackson) { (result: Result<MusicResponseModel, Error>) in
            self.delegate?.hideLoader()
            switch result {
            case .success(let data):
                if let musicList = data.results {
                    self.delegate?.fetchMusicSuccess(with: musicList)
                }
            case .failure(let error):
                self.delegate?.fetchMusicFailure(with: error.localizedDescription)
            }
        }
    }
}
