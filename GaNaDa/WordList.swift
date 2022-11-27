//
//  WordList.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/11/27.
//

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct WordList: View {
  @Environment(\.managedObjectContext) var managedObjectContext
  // 1.
  @FetchRequest(
    // 2.
    entity: WordData.entity(),
    // 3.
    sortDescriptors: [
      NSSortDescriptor(keyPath: \WordData.word, ascending: true)
    ]
    //,predicate: NSPredicate(format: "genre contains 'Action'")
    // 4.
  ) var words: FetchedResults<WordData>

  @State var isPresented = false

  var body: some View {
    NavigationView {
      List {
        ForEach(words, id: \.word) {
            WordRow(word: $0)
        }
        .onDelete(perform: deleteWord)
      }
      .sheet(isPresented: $isPresented) {
        AddWord { title, genre, release in
          self.addMovie(title: title, genre: genre, releaseDate: release)
          self.isPresented = false
        }
      }
      .navigationBarTitle("vocabulary",displayMode: .large)
      .navigationBarItems(trailing:
        Button(action: { self.isPresented.toggle() }) {
          Image(systemName: "plus")
        
        }
      )
    }
  }

  func deleteWord(at offsets: IndexSet) {
    // 1.
    offsets.forEach { index in
      // 2.
      let word = self.words[index]

      // 3.
      self.managedObjectContext.delete(word)
    }

    // 4.
    saveContext()
  }


  func addMovie(word: String, mean: String, adddata: Date) {
    // 1
    let newWord = Word(context: managedObjectContext)

    // 2
    newWord.word = word
    newWord.mean = mean
    newWord.AddDate = adddata

    // 3
    saveContext()
  }


  func saveContext() {
    do {
      try managedObjectContext.save()
    } catch {
      print("Error saving managed object context: \(error)")
    }
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList()
  }
}
