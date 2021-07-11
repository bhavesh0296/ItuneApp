//
//  APIError.swift
//  iTune Music
//
//  Created by bhavesh on 08/07/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

enum APIError: Error {

    //MARK:- deine custom API error come from the service
    case creatingSourceUrlFail

}

extension APIError: LocalizedError {

    var errorDescription: String? {
        switch self {
        case .creatingSourceUrlFail:
            return "creating source url error occur"
        }
    }

    var failureReason: String? {
        switch self {
        case .creatingSourceUrlFail:
            return "creating url from the EndPoints is not correct, Please Check"
        }
    }

}
