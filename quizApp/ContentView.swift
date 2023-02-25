//
//  ContentView.swift
//  quizApp
//
//  Created by Aarni on 14.2.2023.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        GameView(question: ModelData().quizQuestions[0])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
