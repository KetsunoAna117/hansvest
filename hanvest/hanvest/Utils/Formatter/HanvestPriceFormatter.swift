//
//  HanvestPriceFormatter.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import Foundation

struct HanvestPriceFormatter {
    static func formatIntToIDR(_ num: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = "IDR"  // Indonesian Rupiah
        numberFormatter.currencySymbol = "Rp " // Custom currency symbol
        numberFormatter.maximumFractionDigits = 0 // No decimal points
        numberFormatter.locale = Locale(identifier: "id_ID") // Indonesian locale for thousands separator
        
        if let formattedAmount = numberFormatter.string(from: NSNumber(value: num)) {
            return formattedAmount
        } else {
            return "Rp \(num)"
        }
    }
    
    static func formatRupiahStringToSpelledOut(_ input: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        numberFormatter.locale = Locale(identifier: "en")
        
        // Regular expression to match all "Rp" followed by numbers and formatting
        let regexPattern = #"Rp\s[0-9.,]+"#
        
        // Use NSRegularExpression to find all matches
        let regex = try? NSRegularExpression(pattern: regexPattern, options: [])
        let matches = regex?.matches(in: input, options: [], range: NSRange(input.startIndex..<input.endIndex, in: input)) ?? []
        
        var formattedString = input
        
        for match in matches.reversed() { // Reverse to avoid messing with ranges
            if let range = Range(match.range, in: input) {
                let numericPart = String(input[range])
                if let value = Int(numericPart.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)) {
                    let replacedString = "\(value) rupiah"
                    formattedString.replaceSubrange(range, with: replacedString)
                }
            }
        }
        
        return formattedString
    }
    
}


