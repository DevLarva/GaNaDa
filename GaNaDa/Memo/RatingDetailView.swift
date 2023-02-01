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
            Image("star1")
                .resizable()
                .frame(width: 40, height: 40)
        case 2:
            Image("star2")
                .resizable()
                .frame(width: 40, height: 40)
        case 3:
            Image("star3")
                .resizable()
                .frame(width: 40, height: 40)
        case 4:
            Image("star4")
                .resizable()
                .frame(width: 40, height: 40)
        case 5:
            Image("star5")
                .resizable()
                .frame(width: 38, height: 38)
        default:
            Text("❔")
        }
    }
}

struct RatingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingDetailView(rate: 1)
    }
}
