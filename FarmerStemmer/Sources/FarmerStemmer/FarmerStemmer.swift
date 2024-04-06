//
//  FarmerStemmer.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

public protocol FarmerStemmer {
    func stemWords(_ words: [String]) -> Set<String>
}
