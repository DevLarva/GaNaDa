//
//  AddWordView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/11/28.
//

import SwiftUI

struct AddWordView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var word = ""
    @State private var mean = ""
    @State private var rate = 0
    let means = ["asdasd","asdasdads"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Type the Word",text: $word)
                    TextField("Type the Meaning",text: $mean)
                }
                
                Section {
                    RatingView(rate: $rate)
                    
                } header: {
                    Text("Rate difficulty")
                }
                Section {
                    Button("Save") {
                        let newWord = Data(context: moc)
                        newWord.word = word
                        newWord.mean = mean
                        newWord.rate = Int16(rate)
                        try? moc.save()
                        dismiss()
                    }
                }
            }.navigationTitle("Add Word")
        }
    }
        
}

struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView()
    }
}
