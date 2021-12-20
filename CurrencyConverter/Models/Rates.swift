//
//  Rates.swift
//  CurrencyConverter
//
//  Created by Hüseyin BAKAR on 18.12.2021.
//

import Foundation

struct Rates: Decodable {
    var success: Bool? = false
    var timestamp: Int? = 0
    var base: String? = ""
    var date: String? = ""
    var rates: [String: Double]? 
}
