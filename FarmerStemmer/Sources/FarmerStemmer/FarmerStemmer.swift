//
//  FarmerStemmer.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

public struct Stem: Hashable {
    
    // MARK: - Properties
    public let stemmed: String
    public let word: String
    public let timestamp: TimeInterval
}

/// Performs word analysis basic on basic grammatical rules
public protocol FarmerStemmer {
    func stemWords(_ words: [String]) async -> [Stem]
}
