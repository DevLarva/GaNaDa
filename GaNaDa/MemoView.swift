//
//  MemoView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/10/12.
//

import SwiftUI


struct MemoView: View {
    struct TodoList: Identifiable {
        let id = UUID()
        var content: String
        var checked: Bool
    }
    
    @State var toDoString = ""
    @State private var todoLists = [TodoList]()
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Spacer()
                Text("what did you study today?")
                    .font(.title.bold())
                
                HStack {
                    Image(systemName: "square.and.pencil")
                    TextField(
                        "your task",
                        text: $toDoString,
                        onCommit: {
                            appendList()
                        }
                    )
                }
                .textFieldStyle(.plain)
                .frame(width: 300, height: 50, alignment: .center)
                
                List {
                    ForEach(0..<todoLists.count, id: \.self) { i in
                        HStack {
                            Button(action: {
                                toggleCheckedState(i)
                            },
                                   label: {
                                Image(systemName:
                                        todoLists[i].checked == true ?
                                      "checkmark.square" :
                                        "square")
                            }
                            )
                            Text(todoLists[i].content)
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
        let inputList = TodoList(content: toDoString, checked: false)
        todoLists.append(inputList)
        toDoString = ""
    }
    
    func toggleCheckedState(_ i: Int) {
        todoLists[i].checked.toggle()
    }
    
    func deleteList(_ i: Int) {
        todoLists.remove(at: i)
    }
    
}


struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView()
    }
}
