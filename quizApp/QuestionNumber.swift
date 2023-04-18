//
//  QuestionNumber.swift
//  quizApp
//
//  Created by Aarni on 18.4.2023.
//

import Foundation

class QuestionNumber {
    var questionNumber = 0

    func getNumber() -> Int {
        return questionNumber
    }

    func nextNumber() {
        questionNumber += 1
    }

    func resetNumber(number: Int = 0) {
        questionNumber = number - 1
    }
}
