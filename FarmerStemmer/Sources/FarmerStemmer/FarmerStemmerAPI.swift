//
//  FarmerStemmerAPI.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

public class FarmerStemmerAPI: FarmerStemmer {
    
    // MARK: - Properties
    private var cache = FarmerStemmerCache()
    
    // MARK: - Initializer
    public init() { }

    init(cache: FarmerStemmerCache = FarmerStemmerCache()) {
        self.cache = cache
    }
    
    // MARK: - Functionality
    public func stemWords(_ words: [String]) async -> [Stem] {
        let sortedSuffixes = FarmerSuffix.allCases.sorted(by: { $0.length > $1.length })
        var results = [Stem]()
        return await withTaskGroup(of: [Stem].self) { group in
            for word in words {
                group.addTask { [weak self] in
                    guard let strongSelf = self else { return [] }
                    let validWord = word.filter { $0.isLetter }.lowercased()
                    if let cachedResult = strongSelf.cache.getCache(for: validWord) {
                        return cachedResult
                    }
                    for suffix in sortedSuffixes {
                        if validWord.hasSuffix(suffix.rawValue) {
                            let rootWorld = validWord.prefix(validWord.count - suffix.length)
                            let stemmedWords = strongSelf.steam(rootWorld: rootWorld, additions: suffix.additions, word: validWord)
                            strongSelf.cache.setCache(stemmedWords, for: validWord)
                            return stemmedWords
                        }
                    }
                    return [
                        Stem(stemmed: validWord, word: validWord, timestamp: Date.timeIntervalSinceReferenceDate)
                    ]
                }
            }
            
            for await result in group {
                results.append(contentsOf: result)
            }
            
            return results
        }
    }
    
    private func steam(rootWorld: Substring, additions: [String], word: String) -> [Stem] {
        var results = [Stem]()
        if additions.isEmpty {
            let steam = String(rootWorld)
            let timestamp = Date.timeIntervalSinceReferenceDate
            results.append(Stem(stemmed: steam, word: word, timestamp: timestamp))
            return results
        }
        
        for addition in additions {
            let steam = String(rootWorld + addition)
            let timestamp = Date.timeIntervalSinceReferenceDate
            results.append(Stem(stemmed: steam, word: word, timestamp: timestamp))
        }
        
        return results
    }
}
