//
//  ContentView.swift
//  quizApp
//
//  Created by Aarni on 14.2.2023.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: GameView(question: ModelData().quizQuestions[QuestionNumber().getNumber()])) {
                    Text("Start")
                        .frame(width: 200, height: 100)
                        .background(.red)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
