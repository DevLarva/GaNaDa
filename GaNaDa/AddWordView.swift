//
//  AddWordView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/11/28.
//

import SwiftUI

struct AddWordView: View {
    @Environment(\.managedObjectContext) var moc
    
    
    @State private var word = ""
    @State private var mean = ""
    @State private var rate = 3
    let means = ["asdasd","asdasdads"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Type the Word",text: $word)
                    TextField("Type the Meaning",text: $mean)
                }
            }
            Section {
                Picker("Rate Difficulty", selection: $rate) {
                    ForEach(1..<6) {
                        Text(String($0))
                    }
                }
        
            }
            Section {
                Button("Save") {
                    let newWord = Data(context: moc)
                    newWord.word = word
                    newWord.meaning = mean
                    newWord.difficulty = Int16(rate)
                    
                    try? moc.save()
                    
                }
            }
        }.navigationTitle("Add Word")
    }
        
}

struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView()
    }
}
