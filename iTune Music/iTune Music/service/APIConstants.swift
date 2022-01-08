//
//  APIConstants.swift
//  iTune Music
//
//  Created by bhavesh on 08/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

enum APIConstants {
    static let BASE_URL = "https://itunes.apple.com"
}


// MARK:- Private Methods
//private func iTunesURL(searchText: String, category: Category) -> URL {
//  let locale = Locale.autoupdatingCurrent
//  let language = locale.identifier
//  let countryCode = locale.regionCode ?? "US"
//  let kind = category.type
//  let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
//  let urlString = "https://itunes.apple.com/search?term=\(encodedText)&limit=200&entity=\(kind)&lang=\(language)&country=\(countryCode)"
//  let url = URL(string: urlString)
//  print("URL: \(url!)")
//  return url!
//}

//func getFormDataString(parameters:[String:Any]) -> String {
//       var data = [String]()
//       for(key, value) in parameters {
//           data.append(key + "=\(value)")
//       }
//       return data.map { String($0) }.joined(separator: "&")
//   }



//func getFormDataString(parameters:[String:String]) -> String {
//    var data = [String]()
//    for(key, value) in parameters {
//        let encodedText = value.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
//        data.append(key + "=\(encodedText)")
//    }
//    print(data)
//    return data.map { String($0) }.joined(separator: "&")
//}

//print(getFormDataString(parameters: ["term": "Taylor Swift", "Region": "India"]))
