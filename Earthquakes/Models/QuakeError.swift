//
//  QuakeError.swift
//  Earthquakes-iOS
//
//  Created by Олег Алексеев on 15.01.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import Foundation

enum QuakeError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Found and will discard a quake missing a valid code, magnitude, place ord time.",
                comment: ""
            )
        case .networkError:
            return NSLocalizedString(
                "Error fetching quake data over the network.",
                comment: ""
            )
        case .unexpectedError(let error):
            return NSLocalizedString(
                "Received unexpected error. \(error.localizedDescription)",
                comment: ""
            )
        }
    }
}
