//
//  HomeView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/10/01.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTitle: String
    
    var body: some View {

        TabView(selection: $selectedTitle ) {
            MainView()
                .tag("Main")
            MemoView()
                .tag("Memo")
            DeleteView()
                .tag("Delete")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    var body: some View {
        ZStack {
            Text("")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
        }
     
    }
}

struct MemoView: View {
    var body: some View {
        ZStack {
            Text("MemoView")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
        }
       
    }
}
struct DeleteView: View {
    var body: some View {
        ZStack {
            Text("DeleteView")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
        }
    }
}
