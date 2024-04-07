//
//  StemWord.swift
//  FarmerStemmerChallenge
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

struct StemmerItem: Identifiable, Codable {
    var id: String { UUID().uuidString }
    let text: String
    let word: String
    var count: Int
    let timestamp: TimeInterval
    
    mutating func incrementCount() {
        count += 1
    }
}
