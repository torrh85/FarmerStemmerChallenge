//
//  FarmerSuffix.swift
//
//
//  Created by HAWER TORRES on 6/04/24.
//

import Foundation

public enum FarmerSuffix: String, CaseIterable {
    case EVM = "evm"
    case LZ = "lz"
    case ZQ = "zq"
    case L = "l"
    case PZL = "pzl"
    case EZL = "ezl"
    
    var length: Int {
        self.rawValue.count
    }
    
    var additions: [String] {
        switch self {
            case .EVM, .LZ, .ZQ, .L:
                return []
            case .PZL:
                return ["a", "az"]
            case .EZL:
                return ["r"]
        }
    }
}
