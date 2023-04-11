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



struct GameView: View {
    @State private var lastQuestion = false
    @EnvironmentObject var modelData: ModelData
    @State var question: QuizQuestion
    @State var questionNumber = QuestionNumber()
    @State var points = 0

    @State private var selection: Option?


    var body: some View {
        if lastQuestion {
            VictoryView(questionsCorrect: points)
        } else {
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
}

struct GameView_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        GameView(question: ModelData().quizQuestions[0])
            .environmentObject(modelData)
    }
}

