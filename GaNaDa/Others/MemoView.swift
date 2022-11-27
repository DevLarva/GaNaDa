//
//  MemoView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/10/12.
//

import SwiftUI
import CoreData

struct MemoView: View {
    struct MemoList: Identifiable {
        let id = UUID()
        var content: String
        var checked: Bool
        
    }
    
    @State var MemoString = ""
    @State private var MemoLists = [MemoList]()
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                
                Spacer()
                
                Text("what did you study today?")
                    .font(.title.bold())
                
                HStack {
                    Image(systemName: "square.and.pencil")
                    TextField(
                        "Type the word you want",
                        text: $MemoString,
                        onCommit: {
                            appendList()
                        }
                    )
                    
                }
                .textFieldStyle(.plain)
                .frame(width: 300, height: 50, alignment: .center)
                
                List {
                    ForEach(0..<MemoLists.count, id: \.self) { i in
                        HStack {
                            Button(action: {
                                toggleCheckedState(i)
                            },
                                   label: {
                                Image(systemName:
                                        MemoLists[i].checked == true ?
                                      "checkmark.square" :
                                        "square")
                            }
                            )
                            Text(MemoLists[i].content)
                            Spacer()
                            Button(
                                action: {
                                    deleteList(i)
                                },
                                label: {
                                    Image(systemName: "trash")
                                }
                            )
                            
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                    }
                }
            }
        }
        .padding()

    }

    func appendList() {
        let inputList = MemoList(content: MemoString, checked: false)
        MemoLists.append(inputList)
        MemoString = ""
    }
    
    func toggleCheckedState(_ i: Int) {
        MemoLists[i].checked.toggle()
    }
    
    func deleteList(_ i: Int) {
        MemoLists.remove(at: i)
    }
    
}


struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView()
    }
}
