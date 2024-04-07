//
//  FarmerStemmerCache.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

class FarmerStemmerCache {
    
    // MARK: - Properties
    private let queue = DispatchQueue(label: "FarmerStemmerCache.queue", attributes: .concurrent)
    private var dictionary: [String: [Stem]] = [:]
    
    // MARK: - Getting data from cache
    func getCache(for word: String) -> [Stem]? {
        var result: [Stem]?
        queue.sync {
            result = dictionary[word]
        }
        return result
    }
    
    // MARK: - Saving data to cache
    func setCache(_ stems: [Stem], for word: String) {
        queue.async(flags: .barrier) {
            self.dictionary[word] = stems
        }
    }
}
