//
//  OnboardingView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/28.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    var body: some View {
        
        TabView {
            PageView(title: String(localized:"How well do you know Korean?",comment: ""),
                     subtitle: String(localized: "Until now, it was not easy to learn Korean. But what about with GaNaDa?",comment: ""),
                     imageName: "king",
                     showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
            )
            
            PageView(title: String(localized:"learnig",comment: ""),
                     subtitle: String(localized:"Learn a variety of Korean through a simple game",comment: ""),
                     imageName: "student",
                     
                     showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
                     
            )
            
            
            PageView(title: String(localized:"Learning by Repetition ",comment: ""),
                     subtitle:  String(localized:"After completing the study, write it down in a notepad, and repeat the study!",comment: ""),
                     imageName: "student",
                     showsDismissButton: true,
                     shouldShowOnboarding: $shouldShowOnboarding
                     
            )
            
            
            
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
