//
//  GameView.swift
//  quizApp
//
//  Created by Aarni on 14.2.2023.
//

import SwiftUI

class QuestionNumber {
    var questionNumber = 0

    func getNumber() -> Int {
        return questionNumber
    }

    func nextNumber() {
        questionNumber += 1
    }

    func resetNumber(number: Int = 0) {
        questionNumber = number
    }
}


struct GameView: View {
    @State private var lastQuestion = false
    @EnvironmentObject var modelData: ModelData
    @State var question: QuizQuestion
    @State var questionNumber = QuestionNumber()
    var usersAnswers = [String]()

    var body: some View {
        
        if lastQuestion {
            VictoryView()
        }
        else {
            ZStack(alignment: .top) {
                Color(.blue)
                    .ignoresSafeArea()
                VStack() {
                    HStack() {
                        Text("\(question.id)/4")
                            .frame(width: 100, height: 100)
                            .background(.orange)
                    }

                    Text("\(question.question)")
                        .frame(width: 300, height: 100)
                        .background(.yellow)

                    HStack {
                        RadioButtonGroup(items: question.answers, selectedId: "") { selected in
                        }
                    }
                    .padding()
                    .frame(width: 300, height: 400)
                    .background(.green)

                    Button() {
                        if question.id == 4 {
                            lastQuestion.toggle()
                            questionNumber.nextNumber()
                        }
                        if question.id <= 3 {
                            questionNumber.nextNumber()
                            question = ModelData().quizQuestions[questionNumber.getNumber()]
                        }

                    } label: {
                        Text(lastQuestion ? "End" : "Next")
                            .frame(width: 300, height: 100)
                            .foregroundColor(.black)
                            .background(.red)
                    }
                }
                .padding(10)
            }
            .navigationBarBackButtonHidden(true)
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

