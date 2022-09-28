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
            PageView(title: "How well do you know Korean?",
                     subtitle: "Until now, it was not easy to learn Korean. But what about with GaNaDa?",
                     imageName: "king",
                     showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
            )
            
            PageView(title: "learnig",
                     subtitle: "Learn a variety of Korean through a simple game",
                     imageName: "student",
                     
                     showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
                     
            )
            
            
            PageView(title: "Learning by Repetition ",
                     subtitle: "After completing the study, write it down in a notepad, and repeat the study!",
                     imageName: "student",
                     showsDismissButton: true,
                     shouldShowOnboarding: $shouldShowOnboarding
                     
            )
            
            
            
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
