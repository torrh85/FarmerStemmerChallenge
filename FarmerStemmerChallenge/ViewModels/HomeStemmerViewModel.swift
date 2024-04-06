//
//  HomeStemmerViewModel.swift
//  FarmerStemmerChallenge
//
//  Created by HAWER TORRES on 6/04/24.
//

import SwiftUI
import FarmerStemmer

class HomeStemmerViewModel: ObservableObject {
    private var stemmerApi: FarmerStemmerAPI
    private var dataStorage: StemStorage
    
    @Published var text: String = ""
    @Published var items: [StemmerItem] = []
    
    init(stemmerApi: FarmerStemmerAPI = FarmerStemmerAPI(),
         dataStorage: StemStorage = StemStorageAPI()) {
        self.stemmerApi = stemmerApi
        self.dataStorage = dataStorage
        
        items = loadStems()
    }
    
    func performStemming() {
        let texts = text.components(separatedBy: " ")
        Task { [weak self] in
            guard let strongSelf = self else { return }
            let results = await strongSelf.stemmerApi.stemWords(texts)
            await MainActor.run {
                strongSelf.items = strongSelf.updateStems(stems: results)
            }
        }
    }

    private func loadStems() -> [StemmerItem] {
        return dataStorage.get().values.map { $0 }.sorted { $0.timestamp > $1.timestamp }
    }
    
    private func updateStems(stems: [Stem]) -> [StemmerItem] {
        var savedResults = dataStorage.get()

        for stem in stems {
            var savedStem = savedResults[stem.word, default: StemmerItem(
                text: stem.word,
                count: 0,
                timestamp: stem.timestamp)
            ]
            savedStem.incrementCount()
            savedResults[stem.word] = savedStem
        }
        
        dataStorage.save(data: savedResults)
        return savedResults.values.map { $0 }.sorted { $0.timestamp > $1.timestamp }
    }

    func deleteStems() {
        dataStorage.save(data: [:])
        items = loadStems()
    }
}
