//
//  RatingDetailView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/12/03.
//
//MARK: - 평점 매기는 부분(1 ~ 5 -> 이모티콘으로 switch)
import SwiftUI

struct RatingDetailView: View {
    let rate: Int16
    
    var body: some View {
        switch rate {
        case 1:
            Text("🤩")
        case 2:
            Text("😊")
        case 3:
            Text("🧐")
        case 4:
            Text("🥵")
        case 5:
            Text("😱")
        default:
            Text("❔")
        }
    }
}

struct RatingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingDetailView(rate: 3)
    }
}
