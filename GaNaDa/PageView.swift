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
                // 온보딩이 끝나고 메인 페이지로 넘어가기 위한 버튼
                // AppStorage의 isFirstLaunching 값을 false로 바꾸기 때문에, 다음번에 앱을 실행할 때는 OnboardingTabView를 띄우지 않음.
                Button(action: {
                    shouldShowOnboarding.toggle()
                }, label: {
                    Text("Get Start")
                        .bold()
                        .cornerRadius(6)
                        .frame(width: 200, height: 50)
                        .background(Color.yellow)
                        
                    
                })
            }
               
        }
        .padding()
    }
}
