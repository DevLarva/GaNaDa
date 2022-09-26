//
//  ContentView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/24.
//
import SwiftUI

struct ContentView: View {
    @State var shouldShowOnboarding: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("메인입니다.")
                    .padding()
                
            }
            .navigationTitle("Home")
        }
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: { OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
    }
}

// onboarding
struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    var body: some View {
        TabView {
            PageView(title: "asdasd",
                     subtitle: "adsadasd",
                     imageName: "king", showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
            )
                
            PageView(title: "asdasd",
                     subtitle: "adsadasd",
                     imageName: "king", showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
            
            )
                
            
            PageView(title: "asdasd",
                     subtitle: "adsadasd",
                     imageName: "king", showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
            
            )
                
            
            PageView(title: "asdasd",
                     subtitle: "adsadasd",
                     imageName: "king",
                     showsDismissButton: true,
                     shouldShowOnboarding: $shouldShowOnboarding
            
            )
                
            
            
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    let title: String
    let subtitle: String
    let imageName: String
    let showsDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
            
            Text(title)
                .font(.system(size: 32))
                .padding()
            
            
            Text(subtitle)
                .font(.system(size: 24))
                .foregroundColor(Color(.secondaryLabel))
                .padding()
            
            if showsDismissButton {
                Button(action: {
                    shouldShowOnboarding.toggle() 
                }, label: {
                    Text("Get Start")
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(6)
                    
                })
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

