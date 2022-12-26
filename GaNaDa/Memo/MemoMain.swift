//
//  Test.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/11/28.
//

import SwiftUI

//MARK: - 메인 메모 실행 부분

struct MemoMain: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest( sortDescriptors: [
        SortDescriptor(\.word),
        SortDescriptor(\.mean),
        SortDescriptor(\.rate)
    ]) var datas :FetchedResults<Data>
    
    @State private var showingAddScreen = true
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
                }
                .onDelete(perform: deleteWords)// 리스트 삭제
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
    func deleteWords(at offsets: IndexSet) {
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
