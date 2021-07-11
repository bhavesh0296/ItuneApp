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
    var primaryGenreName: String?
    var collectionName: String?
    var wrapperType: String?
    var trackPrice: Float?
    var country: String?
    var releaseDate: String?
    var isLiked: Bool = false

    var isContainVideo: Bool {
        return kind == "feature-movie"
    }

    var albumName: String {
        return collectionName ?? StringConstants.PLACEHOLDER_TEXT
    }

    var trackType: String {
        return kind ?? ( wrapperType ?? StringConstants.PLACEHOLDER_TEXT)
    }

    var price: String {
        guard let price = trackPrice,
            price > 0 else {
                return StringConstants.PLACEHOLDER_TEXT
        }
        return "\(StringConstants.CURRENCY_SYMBOL) \(price)"
    }

    var genre: String {
        return primaryGenreName ?? StringConstants.PLACEHOLDER_TEXT
    }

    var releaseFormattedDate: String {
        guard let date = releaseDate,
            let formattedDate = DateUtility.getFormattedDate(from: date) else {
                return StringConstants.PLACEHOLDER_TEXT
        }
        return formattedDate
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
        case primaryGenreName
        case collectionName
        case wrapperType
        case country
        case trackPrice
        case releaseDate
    }

}
