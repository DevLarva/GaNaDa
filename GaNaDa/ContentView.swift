//
//  ContentView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Guess the Hangul!")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                Spacer()
                Text("Hello! I'm ???이에요~")
                
                Image("한글")
                    .frame(width: 250, height: 250)
                Text("How well do you know Korean?")
                Text("Shall we have fun studying Hangul with me?")
                
                Spacer()
                NavigationLink(
                    destination: NextView(),
                    label: {
                        Text("Let's Go!")
                        
                    })
            }
        }
    }
    
    struct NextView: View {
        @State var tag:Int? = nil
        
        var body: some View {
            NavigationView {
                VStack {
                    Text("한글에 대해서 알아봅시다.")
                    
                    NavigationLink(
                        destination: FinalView(),
                        label: {
                            Text("Next")
                        })
                }
            }
        }
        
        struct FinalView: View {
            var body: some View {
                Text("마지막 화면")
            }
        }
        
        struct ContentView_Previews: PreviewProvider {
            
            static var previews: some View {
                
                ContentView()
                
            }
            
        }
    }
}
