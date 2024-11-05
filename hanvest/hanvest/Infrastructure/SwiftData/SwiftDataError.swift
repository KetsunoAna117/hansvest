//
//  SwiftDataError.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation

enum SwiftDataError: LocalizedError {
    case notFound(object: Any? = nil)
    case alreadyExists(object: Any)
    case failed(object: Any)
    case noData(object: Any)
    case genericError(error: Error)
}
