//
//  Quiz.swift
//  quizApp
//
//  Created by Aarni on 14.2.2023.
//

import Foundation

struct QuizQuestion: Codable, Hashable, Identifiable {
    var id: Int
    var type: String
    var question: String
    var answers: [String]
    var correct: Int
}


