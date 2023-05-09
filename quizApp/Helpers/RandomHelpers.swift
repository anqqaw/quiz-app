//
//  RandomizeQuestionOrder.swift
//  quizApp
//
//  Created by Aarni on 2.5.2023.
//

import Foundation

class RandomHelpers  {

    static func randomizeOrder(quizQuestions: [QuizQuestion]) -> [Int] {
        
        var randomOrder = [Int]()

        while randomOrder.count < 5 { // .endIndex-1
            let randomPick = quizQuestions.randomElement()!

            if !(randomOrder.contains(randomPick.id)) {
                randomOrder.append(randomPick.id)
            }
        }

        return randomOrder

    }
}
