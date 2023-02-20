//
//  SearchView.swift
//  GaNaDaUITests
//
//  Created by 백대홍 on 2023/01/31.
//

import SwiftUI

struct SearchView: View {
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing:10) {
                    Image("tr")
                        .resizable()
                        .frame(width: 400, height: 200)
                        .padding(.vertical)
                 
                    Text("Find additional words you want to know through the link below.")
                        .padding()
                    
                    Divider()
                    
                    HStack(alignment: .center,spacing: 0) {
                        
                        NavigationLink(
                            destination: MyWebview(urlToLoad: "https://translate.google.co.kr/")){
                                
                                //버튼 자체에 대한 코드
                                Image("go")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Text("Google - Translation")
                                
                            }
                        
                        
                    }
                    .padding()
                    Divider()
                    HStack(alignment: .center,spacing: 0) {
                        
                        NavigationLink(
                            destination: MyWebview(urlToLoad: "https://papago.naver.com/")){
                                
                                
                                Image("pa")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Text("Naver - Papago")
                                
                            }
                        
                        
                    }
                    
                    .padding()
                    Divider()
                    
                    
                    
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
