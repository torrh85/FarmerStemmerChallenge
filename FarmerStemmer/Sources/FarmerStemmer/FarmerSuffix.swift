//
//  FarmerSuffix.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

public enum FarmerSuffix: String, CaseIterable {
    case EVM = "EVM"
    case LZ = "LZ"
    case ZQ = "ZQ"
    case L = "L"
    case PZL = "PZL"
    case EZL = "EZL"
    
    var length: Int {
        self.rawValue.count
    }
    
    var additions: [String] {
        switch self {
            case .EVM, .LZ, .ZQ, .L:
                return []
            case .PZL:
                return ["A", "AZ"]
            case .EZL:
                return ["R"]
        }
    }
}
