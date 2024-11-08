//
//  HanvestJSONDecoder.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 08/11/24.
//

import Foundation

struct HanvestJSONDecoder {
    static func decode<T: Decodable>(from filename: String, as type: T.Type) -> T? {
        // Locate the file in the main bundle
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            debugPrint("Failed to locate \(filename) in bundle.")
            return nil
        }
        
        // Load the data
        guard let data = try? Data(contentsOf: url) else {
            debugPrint("Failed to load \(filename) from bundle.")
            return nil
        }
        
        // Decode the JSON into the specified type
        let decoder = JSONDecoder()
        do {
            let decodedObject = try decoder.decode(T.self, from: data)
            return decodedObject
        } catch {
            debugPrint("Failed to decode \(filename): \(error.localizedDescription)")
            return nil
        }
    }

}
