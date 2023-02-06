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
    let sections = [(title: "1 ~ 2 stars", range: 1...2), (title: "3 ~ 4 stars", range: 3...4),(title: "5 stars", range: 5...5)]
    let sectionTitles = ["1 ~ 2 stars", "3 ~ 4 stars", "5 stars"]
    @State private var selectedSectionIndex = 0
    @State private var showingAddScreen = false
    var body: some View {
        
        NavigationStack {
                        List {
                            Picker(selection: $selectedSectionIndex, label: Text("Star rating")) {
                                ForEach(0 ..< sectionTitles.count) {
                                    Text(self.sectionTitles[$0])
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            Section(header: Text(sectionTitles[selectedSectionIndex]).font(.headline).fontWeight(.bold).foregroundColor(.blue)) {
                                ForEach(datas.filter { $0.rate >= sections[selectedSectionIndex].range.lowerBound && $0.rate <= sections[selectedSectionIndex].range.upperBound }) { Data in
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
                                .onDelete(perform: deleteWords)// delete list
                            }
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
