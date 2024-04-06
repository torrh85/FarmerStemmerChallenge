//
//  HomeStemmerViewModel.swift
//  FarmerStemmerChallenge
//
//  Created by HAWER TORRES on 6/04/24.
//

import SwiftUI
import FarmerStemmer

class HomeStemmerViewModel: ObservableObject {
    private var stemmer: FarmerStemmer
    
    @Published var text: String = ""
    @Published var stemWords: [String] = []
    
    init(stemmer: FarmerStemmer = FarmerStemmerAPI()) {
        self.stemmer = stemmer
    }
    
    func stemming() {
        let texts = text.components(separatedBy: " ")
        let result = stemmer.stemWords(texts)
        stemWords = Array(result)
    }
}
