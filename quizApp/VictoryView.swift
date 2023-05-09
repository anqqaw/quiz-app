//
//  VictoryView.swift
//  quizApp
//
//  Created by Aarni on 6.3.2023.
//

import SwiftUI

struct VictoryView: View {
    @State var modelData = ModelData()
    @State var questionsCorrect: Int
    @Binding var lastQuestion: Bool

    var body: some View {
        VStack(alignment: .leading) {
            VStack() {
                Text("You Got")
                    .padding(10)
                    .font(.largeTitle)

                Text("\(questionsCorrect)")
                    .padding(10)
                    .font(.largeTitle)

                Text("Answers Correct")
                    .padding(10)
                    .font(.largeTitle)
            }
            .frame(width: 300)
            .foregroundColor(.blue)
            .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 5)
                    )
            
                Button(action: changeLast) {
                    Text("Play Again")
                        .frame(width: 300, height: 100)
                        .foregroundColor(.purple)
                        .font(.title)
                        .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.purple, lineWidth: 5)
                                )
                }
            }
        }

    func checkCorrectAnswers(answers: [String], correctAnswers: [String]) -> Int {
        var i = 0
        var corrects = 0

        answers.forEach { answer in
            if answer == correctAnswers[i] {
                corrects += 1
            }
            i += 1
        }

        return corrects
    }

    func changeLast() {
        lastQuestion = false
    }

}

struct VictoryView_Previews: PreviewProvider {
    static var previews: some View {
        VictoryView(questionsCorrect: 0, lastQuestion: .constant(true))
    }
}
