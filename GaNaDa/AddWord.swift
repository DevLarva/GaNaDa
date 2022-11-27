//
//  AddWord.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/11/27.
//
import SwiftUI

struct AddWord: View {
  static let DefaultWord = "Please type a word"
  static let DefaultWordMean = ""

  @State var word = ""
  @State var mean = ""
  @State var addDate = Date()
  let onComplete: (String, String, Date) -> Void

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Word")) {
          TextField("Word", text: $word)
        }
        Section(header: Text("Word")) {
          TextField("Mean", text: $mean)
        }
        Section {
          DatePicker(
            selection: $addDate,
            displayedComponents: .date) {
              Text("$Add Date").foregroundColor(Color(.gray))
          }
        }
        Section {
          Button(action: addMoveAction) {
            Text("Add Word")
          }
        }
      }
      .navigationBarTitle(Text("Add Word"), displayMode: .inline)
    }
  }

  private func addMoveAction() {
    onComplete(
      word.isEmpty ? AddWord.DefaultWord : word,
      mean.isEmpty ? AddWord.DefaultWordMean : mean,
      addDate)
  }
}
