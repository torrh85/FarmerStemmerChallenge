//
//  FarmerStemmer.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

public struct Stem: Hashable {
    public let stemmed: String
    public let word: String
    public let timestamp: TimeInterval
}

public protocol FarmerStemmer {
    func stemWords(_ words: [String]) async -> [Stem]
}
