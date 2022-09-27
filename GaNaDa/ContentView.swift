//
//  ContentView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/24.
//
import SwiftUI
struct ContentView: View {
    @State var shouldShowOnboarding: Bool = true
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var gameCount = 0
    @State private var alertAction = ""
    
    @State var showSidebar: Bool = false
    
    var isLastRound: Bool { gameCount == 10 }
    
    
    
    @State private var countries = ["안녕하세요","감사합니다", "안녕히계세요", "잘먹겠습니다", "오늘은 목요일입니다.", "오늘 뭐해요?", "만나서 반가워요", "오늘 날씨 어때요?", "이거 얼마에요?", "지금 몇시인가요?", "저는 한국 사람입니다.", "죄송합니다"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var tappedFlag = ""
    var body: some View {
  
        NavigationView {
            
            VStack {

                Spacer()
                
                Text("Guess the Flag!")
                
                    .font(.largeTitle.bold())
                
                    .foregroundColor(.white)
                
                VStack(spacing:30) {
                    
                    VStack {
                        
                        Text("아래 단어와 일치하는 영어 문장을 고르세요")
                        
                            .foregroundColor(.secondary)
    
                            .font(.subheadline.weight(.heavy))
                        
                        
                        
                        Text(countries[correctAnswer])
                        
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    
                    
                    
                    ForEach(0..<3) { number in
                        
                        Button {
                            
                            
                        } label: {
                            Image(countries[number])
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 5)
                                .rotation3DEffect(.degrees(showingScore && tappedFlag == countries[number] ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .opacity(showingScore && tappedFlag != countries[number] ? 0.25 : 1)
                                .animation(.spring(), value: gameCount)
                            
                        }
                        
                        
                    }
                    
                }
                
                .frame(maxWidth: .infinity)
                
                .padding(.vertical, 20)
                
                .background(.regularMaterial)
                
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                
                
                Text("점수: \(score)")
                
                    .foregroundColor(.white)
                
                    .font(.title.bold())
                
                Spacer()
                
                
                
                
                
            }
            
            .padding()
            
            
            
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

