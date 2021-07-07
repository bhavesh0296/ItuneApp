//
//  MusicResponseModel.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

struct MusicResponseModel: Codable {

    var resultCount: Int?
    var results: [Music]?

    enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }
}
