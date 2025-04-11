//
//  API.swift
//  IOSTest
//
//  Created by Smith Dias on 2025-04-11.
//

import Foundation
struct API: Codable, Identifiable {
    var id: Int { place_id }
    let place_id: Int
    let display_name: String
    let lat: String
    let lon: String
}
