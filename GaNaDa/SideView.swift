//
//  SideView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/10/01.
//

import SwiftUI

struct SideView: View {
    @Binding var selectedTitle: String
    //네임스페이스 선언은 상위 뷰에 선언하고 가장 하위 뷰에 var namespace: Namespace.ID
    //궤적이 들어갈 뷰나 메소드에 namespace: namespace
    @Namespace var namespace
    var body: some View {
        ZStack(alignment: .leading) {
            Color.black.ignoresSafeArea()
            VStack {
                Text("SideView")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(25)
                //SideTapButtom
                VStack(spacing: 15) {
                    TapButton(image: "house", title: "Main", selectedTitle: $selectedTitle, namespace: namespace)
                    TapButton(image: "square.and.pencil", title: "vocabulary", selectedTitle: $selectedTitle, namespace: namespace)
                }
                Spacer()
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .frame(width: 238)
       
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
