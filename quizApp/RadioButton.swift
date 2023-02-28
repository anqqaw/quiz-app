//
//  RadioButton.swift
//  quizApp
//
//  Created by Aarni on 24.2.2023.
//

import SwiftUI

struct RadioButtonGroup: View {
//    @EnvironmentObject var modelData: ModelData()
//    var question: QuizQuestion()

    let items : [String]

    @State var selectedId: String = ""

    let callback: (String) -> ()

    var body: some View {
        VStack {
            ForEach(0..<items.count, id:\.self) { index in
                QuizChoices(self.items[index], callback: self.radioGroupCallback, selectedID: self.selectedId)
            }
        }
    }

    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}

struct RadioButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonGroup(items: ["HELLO"], callback: { _ in })
    }
}
