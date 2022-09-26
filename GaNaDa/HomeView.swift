//
//  HomeView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/24.
//

import SwiftUI

import SwiftUI
 
struct HomeView: View {
    @AppStorage("onboarding") var isWelcomeActive: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Text("HomeView")
                .font(.largeTitle)
            
            Button(action: {
                self.isWelcomeActive = true
            }) {
                Text("OnboardingView")
                    .font(.title)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
