//
//  FileManager+Directory.swift
//  FarmerStemmerChallenge
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL? {
        guard let url = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else {
            return nil
        }
        
        return url
    }
}
