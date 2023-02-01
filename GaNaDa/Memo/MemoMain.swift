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
    
    @State private var showingAddScreen = false
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(datas) { Data in
                    HStack(alignment: .center, spacing: 10) {
                        RatingDetailView(rate: Data.rate)
                            .font(.title)
                            
                            
                        VStack(alignment: .leading) {
                            
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
    
    //MARK: - 메모 삭제 함수
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
