//
//  SwiftDataError.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation

enum SwiftDataError: LocalizedError {
    case notFound(_ object: Any? = nil)
    case alreadyExists(_ object: Any? = nil)
    case failed(_ object: Any? = nil)
    case noData(_ object: Any? = nil)
    case genericError(error: Error)
}
