//
//  APIService.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

class APIService {

    //MARK:- Singleton Instance
    static let shared = APIService()

    //MARK:- private initializer
    private init() { }

    func getRequest<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        let APIUrl = "https://itunes.apple.com/search?term=Michael+jackson"
        let sourcesURL = URL(string: APIUrl)!
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in

            if error != nil {
                completion(.failure(error!))
                return
            }

            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(jsonData))

                } catch {
                    print(String(describing: error))
                    completion(.failure(error))
                }
            }
        }.resume()
    }

}
