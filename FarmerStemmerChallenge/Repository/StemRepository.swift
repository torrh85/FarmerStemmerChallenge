//
//  StemRepository.swift
//  FarmerStemmerChallenge
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

protocol StemRepository {
    func get(word: String) -> String
}
