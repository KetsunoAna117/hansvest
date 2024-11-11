//
//  HanvestError.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 11/11/24.
//

import Foundation

enum HanvestError: LocalizedError {
    case notFound(_ object: Any? = nil)
    case genericError(error: Error)
}
