//
//  Test.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/11/28.
//

import SwiftUI



struct MemoMain: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest( sortDescriptors: [
        SortDescriptor(\.word),
        SortDescriptor(\.mean)
    ]) var datas :FetchedResults<Data>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(datas) { Data in
                    HStack {
                        RatingDetailView(rate: Data.rate)
                            .font(.largeTitle)
                        VStack {
                            Text(Data.word ?? "Unknown word")
                                .font(.headline)
                            Text(Data.mean ?? "Unknown word")
                                .foregroundColor(.secondary)
                        }
                    }
                }.onDelete(perform: deleteBooks)
            }
            .navigationTitle("Vocabulary")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                        
                    } label: {
                        Label("Add Word", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddWordView()
            }
        }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let Data = datas[offset]
            moc.delete(Data)
        }
        
        try? moc.save()
    }
}


struct MemoMain_Previews: PreviewProvider {
    static var previews: some View {
        MemoMain()
    }
}
