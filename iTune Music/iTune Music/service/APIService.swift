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

    
    func getRequest<T: Decodable>(_ endPoint: APIEndPoints, completion: @escaping (Result<T, Error>) -> Void) {
        guard let sourceUrl = endPoint.sourceUrl else {
            completion(.failure(APIError.creatingSourceUrlFail))
            return
        }
        URLSession.shared.dataTask(with: sourceUrl) { (data, urlResponse, error) in

            if let error = error {
                completion(.failure(error))
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

    func getRequest<T: Decodable>(_ endPoint: APIEndPoints, parameters: [String: String]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        guard var sourcePath = endPoint.sourcePath else {
            completion(.failure(APIError.creatingSourceUrlFail))
            return
        }

        var queryString = ""
        if let parameters = parameters {
            queryString = getQueryString(parameters: parameters)
        }

        if !queryString.isEmpty {
            sourcePath = sourcePath + "?" + queryString
        }

        guard let sourceUrl = URL(string: sourcePath) else {
            completion(.failure(APIError.creatingSourceUrlFail))
            return
        }


        URLSession.shared.dataTask(with: sourceUrl) { (data, urlResponse, error) in

            if let error = error {
                completion(.failure(error))
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

    func getQueryString(parameters:[String:String]) -> String {
        var data = [String]()
        for(key, value) in parameters {
            let encodedText = value.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            data.append(key + "=\(encodedText)")
        }
        print(data)
        return data.map { String($0) }.joined(separator: "&")
    }


}
