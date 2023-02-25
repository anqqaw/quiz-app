//
//  QuizChoices.swift
//  quizApp
//
//  Created by Aarni on 15.2.2023.
//

import SwiftUI


struct ColorInvert: ViewModifier {

    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        Group {
            if colorScheme == .dark {
                content.colorInvert()
            } else {
                content
            }
        }
    }
}

struct QuizChoices: View {
    @Environment(\.colorScheme) var colorScheme

    let id: String
    let callback: (String)->()
    let selectedID : String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    
    init(
            _ id: String,
            callback: @escaping (String)->(),
            selectedID: String,
            size: CGFloat = 20,
            color: Color = Color.primary,
            textSize: CGFloat = 14
    ) {
            self.id = id
            self.size = size
            self.color = color
            self.textSize = textSize
            self.selectedID = selectedID
            self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.selectedID == self.id ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                    .modifier(ColorInvert())
                Text(id)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(self.color)
    }
}

struct QuizChoices_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        QuizChoices("Test", callback: { _ in }, selectedID: "0")
    }
}