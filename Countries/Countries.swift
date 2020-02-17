//
//  Countries.swift
//  Countries
//
//  Created by Chris Parker on 14/2/20.
//  Copyright © 2020 Chris Parker. All rights reserved.
//

import Foundation

struct Country: Decodable, Hashable, Identifiable, Equatable {
    let id = UUID()
    let continentCode: String
    let continentName: String
    let countryName: String
    let countryNumber: Int?
    let threeLetterCountryCode: String?
    let twoLetterCountryCode: String
}
