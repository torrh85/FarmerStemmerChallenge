//
//  StemRepository.swift
//  FarmerStemmerChallenge
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation
import FarmerStemmer

protocol StemStorage {
    func get() -> [String: StemmerItem]
    func save(data: [String: StemmerItem])
}

struct StemStorageAPI: StemStorage {
    var fileURL: URL? {
        let fileURL = FileManager.documentDirectory?.appendingPathComponent("stem.json")
        return fileURL
    }
    
    func get() -> [String: StemmerItem] {
        guard let fileURL else { return [:] }
        guard let data = try? Data(contentsOf: fileURL),
              let results = try? JSONDecoder().decode([String: StemmerItem].self, from: data) else { return [:] }
        return results
    }
    
    func save(data: [String: StemmerItem]) {
        guard let jsonData = try? JSONEncoder().encode(data) else {
            return
        }
        
        guard let fileURL else { return }
        
        do {
            try jsonData.write(to: fileURL, options: [])
        } catch {
            print("Failed to write JSON data")
        }
    }
}
