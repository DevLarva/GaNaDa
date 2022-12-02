//
//  Test.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/11/28.
//

import SwiftUI

struct Test: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest( sortDescriptors: []) var datas :FetchedResults<Data>
    
    @State private var showingAddScreen = false
     
    var body: some View {
        NavigationView {
            Text("Count: \(datas.count)")
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
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
