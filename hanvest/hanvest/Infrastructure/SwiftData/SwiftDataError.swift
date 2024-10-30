//
//  SwiftDataError.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation

enum SwiftDataError: LocalizedError {
    case notFound
    case alreadyExists
    case failed
    case noData
    case genericError(error: Error)
}
