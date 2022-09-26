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
            .navigationTitle("Guess the Hangul!")
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
            PageView(title: "How well do you know Korean?",
                     subtitle: "Until now, it was not easy to learn Korean. But what about with GaNaDa?",
                     imageName: "king",
                     subimageName:"gyeongbokgung-palace",
                     showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
            )
                
            PageView(title: "Learn",
                     subtitle: "간단한 게임으로 다양한 한국어를 학습 해보세요",
                     imageName: "student",
                     subimageName:"south-korea",
                     showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
            
            )
            
            
            PageView(title: "블라블라",
                     subtitle: "",
                     imageName: "",
                     subimageName:"",
                     showsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding
            
            )
                
            
            PageView(title: "블라블라",
                     subtitle: "",
                     imageName: "",
                     subimageName:"",
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
    let subimageName: String
    let showsDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                
     Spacer()
     Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 200.0)
                    .offset(x: 0, y: 150)
                    .overlay(
                        Image(subimageName)
                            .resizable()
                            .scaledToFit()
                            .offset(x: 0, y: -50)
                        
                    )
                        } //이미지 두개 겹쳐 보이게 하기
            
               
    
                
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
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

