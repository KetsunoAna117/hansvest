//
//  debugPrint.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 08/11/24.
//

func debugPrint(_ string: String) {
    #if DEBUG
    Swift.debugPrint(string)
    #endif
}
