//
//  DateUtility.swift
//  iTune Music
//
//  Created by bhavesh on 08/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

class DateUtility {

    class func getFormattedDate(from text: String) -> String? {

        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let formattedDate = dateFormatterGet.date(from: text) {
            return dateFormatterPrint.string(from: formattedDate)
        }
        return nil
    }
}
