//
//  RandomizeQuestionOrder.swift
//  quizApp
//
//  Created by Aarni on 2.5.2023.
//

import Foundation

class RandomHelpers  {

    static func randomizeOrder(modelData: ModelData) -> [Int] {
        
        var randomOrder = [Int]()

        while modelData.quizQuestions.count < 5 { // modelData.quizQuestions.endIndex-1
            let randomPick = modelData.quizQuestions.randomElement()!

            if !(randomOrder.contains(randomPick.id)) {
                randomOrder.append(randomPick.id)
            }
        }

        return randomOrder

    }
}
