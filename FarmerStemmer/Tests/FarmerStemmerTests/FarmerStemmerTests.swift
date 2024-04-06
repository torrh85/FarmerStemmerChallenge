//
//  FarmerStemmerTests.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

import XCTest
@testable import FarmerStemmer

final class FarmerStemmerTests: XCTestCase {
    private var stemmer: FarmerStemmer!
    
    override func setUp() {
        super.setUp()
        stemmer = FarmerStemmerAPI()
    }
    
    override func tearDown() {
        stemmer = nil
    }
    
    func testSuffix_L_Rule() async {
        // Given
        let input = ["XZIHNZL", "XZIHESNZL", "XZIHNZL"]
        
        // When
        let stemWords = await stemmer.stemWords(input)
        let words = stemWords.map { $0.word }.sorted()
        
        // Then
        XCTAssertEqual(words.count, 3)
        XCTAssertEqual(words, ["XZIHNZ", "XZIHESNZ", "XZIHNZ"].map { $0.lowercased() }.sorted())
    }
    
    func testSuffix_LZ_Rule() async {
        // Given
        let input = ["IHFULZ", "EEESNZLZ", "AAABLZ", "EEELZ", "NMUYLZ", "LORELZ", "BJSELZ","AXDDLZ", "IHFULZ"]
        
        // When
        let stemWords = await stemmer.stemWords(input)
        let words = stemWords.map { $0.word }.sorted()
        
        // Then
        XCTAssertEqual(words.count, 9)
        XCTAssertEqual(words, ["IHFU", "EEESNZ", "AAAB", "EEE", "NMUY", "LORE", "BJSE","AXDD", "IHFU"].map { $0.lowercased() }.sorted())
    }
    
    func testSuffix_EVM_Rule() async {
        // Given
        let input = ["IHFTEVM", "IHFTEVM", "IHFTEVM", "IHFTEVM", "IHFTEVM", "GNDEVM"]
        
        // When
        let stemWords = await stemmer.stemWords(input)
        let words = stemWords.map { $0.word }.sorted()
        
        // Then
        XCTAssertEqual(words.count, 6)
        XCTAssertEqual(words, ["IHFT", "IHFT", "IHFT", "IHFT", "IHFT", "GND"].map { $0.lowercased() }.sorted())
    }
    
    func testSuffix_ZQ_Rule() async {
        // Given
        let input = ["QELLHSPZQ", "QELLHSPZQ", "CNSWZQ", "QELLHSPZQ"]
        
        // When
        let stemWords = await stemmer.stemWords(input)
        let words = stemWords.map { $0.word }.sorted()
        
        // Then
        XCTAssertEqual(words.count, 4)
        XCTAssertEqual(words, ["QELLHSP", "QELLHSP", "CNSW", "QELLHSP"].map { $0.lowercased() }.sorted())
    }
    
    func testSuffix_PZL_Rule() async {
        // Given
        let input = ["UZCUZLZVKDKEPZL", "UZCUZLZVKDKEPZL"]
        
        // When
        let stemWords = await stemmer.stemWords(input)
        let words = stemWords.map { $0.word }.sorted()
        
        // Then
        XCTAssertEqual(words.count, 4)
        XCTAssertEqual(words, ["UZCUZLZVKDKEA", "UZCUZLZVKDKEAZ", "UZCUZLZVKDKEA", "UZCUZLZVKDKEAZ"].map { $0.lowercased() }.sorted())
    }
    
    func testSuffix_EZL_Rule() async {
        // Given
        let input = ["DUNEZL"]
        
        // When
        let stemWords = await stemmer.stemWords(input)
        let words = stemWords.map { $0.word }
        
        // Then
        XCTAssertEqual(words.count, 1)
        XCTAssertEqual(words, ["DUNR"].map { $0.lowercased() })
    }
    
    func testInvalidWord() async {
        // Given
        let input = ["LSDDEZL0834#"]
        
        // When
        let stemWords = await stemmer.stemWords(input)
        let words = stemWords.map { $0.word }
        
        // Then
        XCTAssertEqual(words.count, 1)
        XCTAssertEqual(words, ["lsddr"])
    }
}
