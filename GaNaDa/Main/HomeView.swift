//
//  HomeView.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/10/01.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTitle: String
    
    var body: some View {
        
        TabView(selection: $selectedTitle ) {
            MainView()
                .tag("Main")
            MemoMain()
                .tag("Vocabulary")
        }
        .frame(width: getRect().width)
    }
}



struct MainView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @AppStorage("_Firstrun") var Firstrun: Bool = true
    @State var ShowOnboarding: Bool = true
    @State private var score = 0
    @State private var gameCount = 0
    @State private var alertAction = ""
    var isLastRound: Bool { gameCount == 10 }
    @State var selectedTitle = "Main"
    @State var showSide = false
    @State private var words = ["Hello","Thank You","Happy birthday","It's delicious","i like you","It's ok","Do you have time tomorrow","How are you?","What are you doing","I'm happy","Happy new year","Good night","where are you from?","See you tomorrow"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var tappedBox = ""
    
    @State private var translated_word = [NSLocalizedString("Hello",comment: ""),NSLocalizedString("Thank You",comment: ""),NSLocalizedString("Happy birthday",comment:""),NSLocalizedString("It's delicious",comment: ""),NSLocalizedString("i like you",comment: ""),NSLocalizedString("It's ok",comment: ""),NSLocalizedString("Do you have time tomorrow",comment: ""),NSLocalizedString("How are you?",comment: ""),NSLocalizedString("What are you doing",comment: ""),NSLocalizedString("I'm happy",comment: ""), NSLocalizedString("Happy new year",comment: ""),NSLocalizedString("Good night",comment: ""),NSLocalizedString("where are you from?",comment: ""),NSLocalizedString("See you tomorrow",comment: "")].shuffled()
    
    let description = [
        "Hello" :  "It's a word you use to greet each other." ,
        "Thank You" :  "It's a word used to express gratitude to the other person." ,
        "Happy birthday" :  "It's a word used to celebrate a birthday." ,
        "It's delicious" :  "It means delicious" ,
        "i like you" :  "It means that I like you" ,
        "It's ok" :  "This means it's okay" ,
        "Do you have time tomorrow" :  "It is often used to make an appointment with the other person by saying, What are you doing tomorrow?" ,
        "How are you?" :  "It is used a lot to ask how the other person is doing." ,
        "What are you doing" :  "It's a word you use when you wonder what the other person is doing." ,
        "I'm happy" :  "It means that I'm very happy right now" ,
        "Happy new year" :  "It's a word used to say New Year's greetings.",
        "Good night" : "It's a word I use before I go to bed.",
        "where are you from?" : "It means asking which country the other person is from.",
        "See you tomorrow" : "It means to see you tomorrow, so it is usually used for those who break up and see you later."
    ]
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            
            VStack {
                
                
                Spacer()
                Text("Guess the Hangul!")
                
                    .font(.largeTitle.bold())
                
                    .foregroundColor(.black)
                
                VStack(spacing:40) {
                    
                    
                    VStack {
                      
                        
                        
                        Text("Choose a word that matches each other")
                        
                            .foregroundColor(.black)
                        
                            .font(.subheadline.weight(.heavy))
                        
                        
                        
                        Text(words[correctAnswer])
                        
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    
                    
                    ForEach(0..<3) { number in
                        
                        Button {
                            
                            Buttonapped(number)
                            
                        } label: {
                            Image(words[number])
                                .resizable()
                                .frame(width: 200.0, height: 100.0)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 5)
                                .rotation3DEffect(.degrees(showingScore && tappedBox == words[number] ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .opacity(showingScore && tappedBox != words[number] ? 0.25 : 1)
                                .animation(.spring(), value: gameCount)
                                .accessibilityLabel(description[words[number], default: "Unknown Box."])
                            
                            
                        }
                        
                        
                    }
                    .fullScreenCover(isPresented: $Firstrun) {
                        OnboardingView(ShowOnboarding: $Firstrun)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                
                .padding(.vertical, 20)
                
                .background(Color(red: 244 / 255, green: 206 / 255, blue: 113 / 255))
                
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                
                
                Text("Score: \(score)")
                
                    .foregroundColor(.black)
                
                    .font(.title.bold())
                
                Spacer()
                
                
                
                
                
            }
            
            .padding()
            
            
            
        }
        
        .alert(scoreTitle,isPresented:  $showingScore) {
            
            Button(alertAction) {
                
                askQuestion()
                
            }
            
            
            
        } message: {
            
            Text(scoreMessage)
            
        }
        
    }
    
    func Buttonapped(_ number:Int) {
        
        tappedBox = words[number]
        
        showingScore = true
        
        gameCount += 1
        
        
        
        if number == correctAnswer {
            
            score += 10
            
            
            scoreTitle  = isLastRound ? NSLocalizedString("Game Over",comment: "") : NSLocalizedString("Correct!",comment: "")
            
            scoreMessage = isLastRound ? String(localized: "Your final Score: \(score)",comment:"") : String(localized:"Score: \(score)",comment: "")
            
            
        } else {
            
            scoreTitle = isLastRound ? NSLocalizedString("Game Over",comment: "") : NSLocalizedString("wrong answer",comment: "")
            
            scoreMessage = String(localized: "The answer you choose mean \(words[number]) in Korean.",comment: "")
            
        }
        
        
        
        alertAction = isLastRound ? NSLocalizedString("Restart",comment: "") : NSLocalizedString("Confirm",comment: "")
        
    }
    
    
    
    func askQuestion() {
        
        if isLastRound {
            
            gameCount = 0
            
            score = 0
            
        }
        
        
        
        words = words.shuffled()
        
        correctAnswer = Int.random(in: 0...2)
        
    }
    
    
    
}


//추가할것? 한국어에 대한 현지어는?애초에 필요없고,
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
