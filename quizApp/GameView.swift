//
//  GameView.swift
//  quizApp
//
//  Created by Aarni on 14.2.2023.
//

import SwiftUI

struct GameView: View {
    @State private var lastQuestion = false
    @EnvironmentObject var modelData: ModelData
    var question: QuizQuestion

    var quizQuestionIndex: Int {
        modelData.quizQuestions.firstIndex(where: { $0.id == question.id })!
    }

    var body: some View {
        ZStack() {
            Color(.blue)
                .ignoresSafeArea()
            VStack() {
                HStack(alignment: .top) {
                    Spacer()
                    Text("\(question.id)/4")
                        .frame(width: 100, height: 100)
                        .background(.orange)
                }

                Text("\(question.question)")
                    .frame(width: 300, height: 100)
                    .background(.yellow)

                HStack {
                    RadioButtonGroup(items: [question.answers[0], question.answers[1], question.answers[2], question.answers[3]], selectedId: "") { selected in
                    }
                }
                .padding()
                .frame(width: 300, height: 400)
                .background(.green)

                Button {
                    lastQuestion.toggle()
                } label: {
                    Text(lastQuestion ? "End" : "Next")
                        .frame(width: 300, height: 100)
                        .foregroundColor(.black)
                        .background(.red)
                }

            }
            .padding(10)
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

