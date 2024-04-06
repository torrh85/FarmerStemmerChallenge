//
//  FarmerStemmerCache.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

class FarmerStemmerCache {
    private let queue = DispatchQueue(label: "FarmerStemmerCache.queue", attributes: .concurrent)
    private var dictionary: [String: [Stem]] = [:]
    
    func getCache(for word: String) -> [Stem]? {
        var result: [Stem]?
        queue.sync {
            result = dictionary[word]
        }
        return result
    }
    
    func setCache(_ stems: [Stem], for word: String) {
        queue.async(flags: .barrier) {
            self.dictionary[word] = stems
        }
    }
}
