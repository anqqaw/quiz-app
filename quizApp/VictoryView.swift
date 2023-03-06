//
//  VictoryView.swift
//  quizApp
//
//  Created by Aarni on 6.3.2023.
//

import SwiftUI

struct VictoryView: View {
    @State var modelData = ModelData()
    @State var questionsCorrect = 0

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
//            .background(.blue)
            .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 5)
                    )
            
            Button() {

                QuestionNumber().resetNumber()
            } label: {
                Text("Play Again")
                    .frame(width: 300, height: 100)
                    .foregroundColor(.purple)
                    .font(.title)
                    //.background(.purple)
                    .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.purple, lineWidth: 5)
                            )
            }
        }
    }
}

struct VictoryView_Previews: PreviewProvider {
    static var previews: some View {
        VictoryView()
    }
}
