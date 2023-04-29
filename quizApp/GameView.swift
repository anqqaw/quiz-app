//
//  GameView.swift
//  quizApp
//
//  Created by Aarni on 14.2.2023.
//

import SwiftUI


struct GameView: View {
    @State var lastQuestion = false
    @EnvironmentObject var modelData: ModelData
    @State var question: QuizQuestion
//    @State var questionNumber = QuestionNumber()
    @State var points = 0


    var body: some View {
        if lastQuestion {
            VictoryView(questionsCorrect: points, lastQuestion: $lastQuestion)
        } else {
            QuizView(lastQuestion: $lastQuestion, question: question, points: $points)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        GameView(question: ModelData().quizQuestions[0])
            .environmentObject(modelData)
    }
}

