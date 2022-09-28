//
//  PageView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/28.
//

import SwiftUI

struct PageView: View {
    let title: String
    let subtitle: String
    let imageName: String
    let showsDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .padding()
                
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
                
                
                Text(subtitle)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 250)
                    .foregroundColor(Color(red: 237 / 255, green: 203 / 255, blue: 150 / 255))
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
                
            }
            if showsDismissButton {
                Button(action: {
                    shouldShowOnboarding.toggle()
                }, label: {
                    Text("Get Start")
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(6)
                    
                })
            }
               
        }
        .padding()
    }
}
