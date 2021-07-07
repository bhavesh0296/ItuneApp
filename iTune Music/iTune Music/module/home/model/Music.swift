//
//  Music.swift
//  iTune Music
//
//  Created by bhavesh on 07/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

struct Music: Codable {

    var trackName: String?
    var artistId: Int?
    var artistName: String?
    var previewUrl: String?
    var artworkUrl: String?
    var kind: String?
    var collectionViewUrl: String?
    var artistViewUrl: String?

    var isLiked: Bool = false
    var isContainVideo: Bool {
        return kind == "feature-movie"
    }

    enum CodingKeys: String, CodingKey {
        case trackName
        case artistId
        case artistName
        case previewUrl
        case artworkUrl = "artworkUrl100"
        case kind
        case collectionViewUrl
        case artistViewUrl
    }

}
