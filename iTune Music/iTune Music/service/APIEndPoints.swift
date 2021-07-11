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
    case searchMichaelJackson = "/search?term=Michael+jackson"

    //MARK:- Use to get Source Url with the Base Url adding
    var sourceUrl: URL? {
        let sourcePath = APIConstants.BASE_URL + self.rawValue
        let sourceUrl = URL(string: sourcePath)
        return sourceUrl
    }
}
