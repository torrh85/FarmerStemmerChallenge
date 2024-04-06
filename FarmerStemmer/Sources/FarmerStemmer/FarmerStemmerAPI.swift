//
//  FarmerStemmerAPI.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

public class FarmerStemmerAPI: FarmerStemmer {
    private var cache: [String: Set<String>] = [:]
    
    public init() { }
    
    public func stemWords(_ words: [String]) -> Set<String> {
        var results = Set<String>()
        let sortedSuffixes = FarmerSuffix.allCases.sorted(by: { $0.length > $1.length })
        
        for word in words {
            if let cacheResult = cache[word] {
                results.formUnion(cacheResult)
                continue
            }
            
            for suffix in sortedSuffixes {
                if word.hasSuffix(suffix.rawValue) {
                    let rootWorld = word.prefix(word.count - suffix.length)
                    let stemmedWords = steam(rootWorld: rootWorld, additions: suffix.additions)
                    cache[word] = stemmedWords
                    results.formUnion(stemmedWords)
                    break
                }
            }
        }
        
        return results
    }
    
    private func steam(rootWorld: Substring, additions: [String]) -> Set<String> {
        var results = Set<String>()
        if additions.isEmpty {
            results.insert(String(rootWorld))
            return results
        }
        
        for addition in additions {
            results.insert(rootWorld + addition)
        }
        
        return results
    }
}
