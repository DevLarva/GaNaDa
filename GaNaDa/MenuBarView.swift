//
//  MenuBarView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/28.
//
import SwiftUI
struct MenuBarView: View {
    var body: some View {
           VStack(alignment: .leading){
               HStack{
                   Image(systemName: "person")
                       .foregroundColor(.gray)
                       .imageScale(.large)
                   Text("Profile")
                       .foregroundColor(.gray)
                       .font(.headline)
               }
               .padding(.top, 100)
               HStack{
                   Image(systemName: "envelope")
                       .foregroundColor(.gray)
                       .imageScale(.large)
                   Text("단어장")
                       .foregroundColor(.gray)
                       .font(.headline)
               }
               .padding(.top, 30)
               HStack{
                   Image(systemName: "gear")
                       .foregroundColor(.gray)
                       .imageScale(.large)
                   Text("Settings")
                       .foregroundColor(.gray)
                       .font(.headline)
               }
               .padding(.top, 30)
               Spacer()
           }
               .padding()
               .frame(maxWidth: .infinity, alignment:.leading)
               .background(Color.white)
           .edgesIgnoringSafeArea(.all)
       }
   }

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
    }
}
