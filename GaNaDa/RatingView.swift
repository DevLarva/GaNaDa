//
//  RatingView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/12/02.
//

import SwiftUI

struct RatingView: View {
    @Binding var rate: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id:\.self) { number in
                image(for: number)
                    .foregroundColor(number > rate ? offColor : onColor)
                    .onTapGesture {
                        rate = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rate {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rate: .constant(4))
    }
}
