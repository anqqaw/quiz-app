//
//  RadioButton.swift
//  quizApp
//
//  Created by Aarni on 24.2.2023.
//

import SwiftUI

//struct RadioButtonGroup: View {
//
//    let items : [String]
//
//    @State var selectedId: String = ""
//
//    let callback: (String) -> ()
//
//    var body: some View {
//        VStack {
//            ForEach(0..<items.count, id:\.self) { index in
//                RadioButton(self.items[index], callback: self.radioGroupCallback, selectedID: self.selectedId)
//            }
//        }
//    }
//
//    func radioGroupCallback(id: String) {
//        selectedId = id
//        callback(id)
//    }
//}

struct RadioButton<Tag, CircleButton, Label>: View
where Tag : Hashable, CircleButton : View, Label : View {
  let tag: Tag
  @Binding var selection: Tag?
  @ViewBuilder let button: (Bool) -> CircleButton
  @ViewBuilder let label: () -> Label

  var body: some View {
    Button {
      selection = tag
    } label: {
      HStack {
        button(selection == tag)
        label()
      }
    }
    .buttonStyle(.plain)
  }
}

struct RadioButtonGroup<Tag, CircleButton, Label>: View
where Tag : Hashable, CircleButton : View, Label : View {
  @Binding var selection: Tag?
  let orientation: Orientation
  let tags: [Tag]
  @ViewBuilder let button: (Bool) -> CircleButton
  @ViewBuilder let label: (Tag) -> Label

  var body: some View {
    if orientation == .horizonal {
      HStack(alignment: .top) {
        radioButtons
      }
    } else {
      VStack(alignment: .leading) {
        radioButtons
      }
    }
  }

  @ViewBuilder private var radioButtons: some View {
    ForEach(tags, id: \.self) { tag in
      RadioButton(tag: tag, selection: $selection, button: button) {
        label(tag)
      }
    }
  }

  enum Orientation {
    case horizonal, vertical
  }
}


//struct RadioButtonGroup_Previews: PreviewProvider {
//    static var previews: some View {
//         RadioButtonGroup(items: ["HELLO"], callback: { _ in })
//    }
//}
