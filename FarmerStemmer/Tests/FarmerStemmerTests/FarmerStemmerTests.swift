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
    
    func testSuffix_L_Rule() {
        // Given
        let input = ["XZIHNZL", "XZIHESNZL", "XZIHNZL"]
        
        // When
        let stemWords = stemmer.stemWords(input)
        
        // Then
        XCTAssertEqual(stemWords.count, 2)
        XCTAssertEqual(stemWords, ["XZIHESNZ", "XZIHNZ"])
    }
    
    func testSuffix_LZ_Rule() {
        // Given
        let input = ["IHFULZ", "EEESNZLZ", "AAABLZ", "EEELZ", "NMUYLZ", "LORELZ", "BJSELZ","AXDDLZ", "IHFULZ"]
        
        // When
        let stemWords = stemmer.stemWords(input)
        
        // Then
        XCTAssertEqual(stemWords.count, 8)
        XCTAssertEqual(stemWords, ["IHFU", "EEESNZ", "AAAB", "EEE", "NMUY", "LORE", "BJSE", "AXDD"])
    }
    
    func testSuffix_EVM_Rule() {
        // Given
        let input = ["IHFTEVM", "IHFTEVM", "IHFTEVM", "IHFTEVM", "IHFTEVM", "GNDEVM"]
        
        // When
        let stemWords = stemmer.stemWords(input)
        
        // Then
        XCTAssertEqual(stemWords.count, 2)
        XCTAssertEqual(stemWords, ["IHFT", "GND"])
    }
    
    func testSuffix_ZQ_Rule() {
        // Given
        let input = ["QELLHSPZQ", "QELLHSPZQ", "CNSWZQ", "QELLHSPZQ"]
        
        // When
        let stemWords = stemmer.stemWords(input)
        
        // Then
        XCTAssertEqual(stemWords.count, 2)
        XCTAssertEqual(stemWords, ["QELLHSP", "CNSW"])
    }
    
    func testSuffix_PZL_Rule() {
        // Given
        let input = ["UZCUZLZVKDKEPZL", "UZCUZLZVKDKEPZL", "UZCUZLZVKDKAPZL"]
        
        // When
        let stemWords = stemmer.stemWords(input)
        
        // Then
        XCTAssertEqual(stemWords.count, 4)
        XCTAssertEqual(stemWords, ["UZCUZLZVKDKEA", "UZCUZLZVKDKEAZ", "UZCUZLZVKDKAA", "UZCUZLZVKDKAAZ"])
    }
    
    func testSuffix_EZL_Rule() {
        // Given
        let input = ["DUNEZL"]
        
        // When
        let stemWords = stemmer.stemWords(input)
        
        // Then
        XCTAssertEqual(stemWords.count, 1)
        XCTAssertEqual(stemWords, ["DUNR"])
    }
}
