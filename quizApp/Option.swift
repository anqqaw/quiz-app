//
//  Option.swift
//  quizApp
//
//  Created by Aarni on 18.4.2023.
//

import Foundation

enum Option: CaseIterable {
    case first, second, third, fourth

    var description: Int {
        switch self {
        case .first:
            return 0
        case .second:
            return 1
        case .third:
            return 2
        case .fourth:
            return 3
        }
    }
    
    static func amount(sizeOfArray: Int) -> [Option] {
        switch sizeOfArray {
            case 1:
                return [.first]
            case 2:
                return [.first, .second]
            case 3:
                return [.first, .second, .third]
            case 4:
                return [.first, .second, .third, .fourth]
            default:
                return []
        }
    }
}

