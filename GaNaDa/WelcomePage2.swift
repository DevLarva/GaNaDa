//
//  WelcomePage2.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/26.
//

import SwiftUI

struct WelcomePage2: View {
    var imageString: String
    var body: some View {
        Image(imageString)
            .resizable()
            .clipped()
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage2(imageString: "한글")
        
    }
}
