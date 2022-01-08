//
//  APIEndPoints.swift
//  iTune Music
//
//  Created by bhavesh on 08/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

enum APIEndPoints: String {

    //MARK:- End Points to make API call
//    case searchMichaelJackson = "/search?term=Michael+jackson"
    case searchMichaelJackson = "/search?term=Taylor+Swift"
    case search = "/search"

    //MARK:- Use to get Source Url with the Base Url adding
    var sourceUrl: URL? {
        let sourcePath = APIConstants.BASE_URL + self.rawValue
//        let sourcePath = APIConstants.BASE_URL + "/search?term=Taylor%20Swift"
        let sourceUrl = URL(string: sourcePath)
        return sourceUrl
    }

     //MARK:- Use to get Source Url with the Base Url adding
        var sourcePath: String? {
            let sourcePath = APIConstants.BASE_URL + self.rawValue
    //        let sourcePath = APIConstants.BASE_URL + "/search?term=Taylor%20Swift"
//            let sourceUrl = URL(string: sourcePath)
            return sourcePath
        }
}


//func getFormDataString(parameters:[String:String]) -> String {
//    var data = [String]()
//    for(key, value) in parameters {
//        let encodedText = value.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
//        data.append(key + "=\(encodedText)")
//    }
//    print(data)
//    return data.map { String($0) }.joined(separator: "&")
//}


