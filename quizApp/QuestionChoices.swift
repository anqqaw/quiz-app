//
//  QuestionChoices.swift
//  quizApp
//
//  Created by Aarni on 15.2.2023.
//

import SwiftUI

struct QuestionChoices: View {
    @State private var selected = 1
    var quizQuestion: QuizQuestion
    
    var body: some View {
        VStack(spacing: 20) {
            // selectiin käyttäjän oma valinta ja textiin kysymys
            Picker((selection: $selected, label: Text(quizQuestion.question)
                Text(QuizQuestion.answers[0]).tag(1)
                Text(QuizQuestion.answers[1]).tag(2)
                Text(QuizQuestion.answers[2]).tag(3)
                Text(QuizQuestion.answers[3]).tag(4)
        }
    }
}

struct QuestionChoices_Previews: PreviewProvider {
    static var previews: some View {
        QuestionChoices(quizQuestion: quizQuestion)
    }
}
