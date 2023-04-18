//
//  QuizView.swift
//  quizApp
//
//  Created by Aarni on 18.4.2023.
//

import SwiftUI

struct QuizView: View {
    @Binding var lastQuestion: Bool
//    @EnvironmentObject var modelData: ModelData
    @State var question: QuizQuestion
    @State var questionNumber = QuestionNumber()
    @Binding var points: Int

    @State private var selection: Option?

    var body: some View {
        ZStack(alignment: .top) {
            Color(.blue)
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack() {
                    HStack() {
                        Text("\(questionNumber.getNumber() + 1)/\(ModelData().quizQuestions.count)")
                            .frame(width: 100, height: 100)
                            .background(.orange)
                    }

                    Text("\(question.question)")
                        .frame(width: 300, height: 100)
                        .background(.yellow)
                    HStack {
                        RadioButtonGroup(selection: $selection,
                                         orientation: .vertical,
                                         tags: Option.amount(sizeOfArray: question.answers.count),
                                         button: { isSelected in
                            ZStack {
                                Circle()
                                    .foregroundColor(.purple)
                                    .frame(width: 32, height: 32)
                                if isSelected {
                                    Circle()
                                        .foregroundColor(Color.yellow)
                                        .frame(width: 16, height: 16)
                                }
                            }
                        },
                                         label: { tag in
                            Text(question.answers[(tag.description)])
                        })
                        Spacer()
                    }
                    .padding()
                    .frame(width: 300, height: 250)
                    .background(.green)

                    Button() {
                        if selection?.description == question.correct {
                            points += 1
                        }

                        if questionNumber.getNumber() == ModelData().quizQuestions.count - 1 {
                            lastQuestion.toggle()
                            questionNumber.resetNumber()
                        }

                    if questionNumber.getNumber() < ModelData().quizQuestions.count - 1 {
                            questionNumber.nextNumber()
                            question = ModelData().quizQuestions[questionNumber.getNumber()]
                        }

                        selection = nil

                    } label: {
                        Text(questionNumber.getNumber() == ModelData().quizQuestions.count - 1 ? "End" : "Next")
                            .frame(width: 300, height: 100)
                            .foregroundColor(.black)
                            .background(.red)
                    }
                }
                .padding(10)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct QuizView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        QuizView()
//    }
//}
