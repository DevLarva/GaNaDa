import SwiftUI



struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State var shouldShowOnboarding: Bool = true
    @State private var score = 0
    @State private var gameCount = 0
    @State private var alertAction = ""
    

    var isLastRound: Bool { gameCount == 10 }
    @State var selectedTitle = "Main"
    @State var showSide = false
    //Sliding을 위한 변수
    @State var translation: CGSize = .zero
    @State var offsetX: CGFloat = -120
    
    //TabView를 사용하면(스크롤 미사용시) 보이지 않는 페이지버튼이 하단에 TabBar로 생성된다. 이것을 제거하는 초기화 코드
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    
    @State private var words = ["Hello","Thank You","Happy birthday","It's delicious","i like you","It's ok","Do you have time tomorrow","How are you?","What are you doing","I'm happy","Happy new year","Good night","where are you from?","See you tomorrow"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var tappedBox = ""
    
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
            
            RoundedRectangle(cornerRadius: 20)
            
                .fill(
                    
                    AngularGradient(gradient: Gradient(colors: [Color.purple, Color.yellow]),
                                    
                                    center: .topLeading,
                                    
                                    angle: .degrees(180 + 45))
                    
                )
            
                .ignoresSafeArea()
            
            
            
            
            
            VStack {
                
                Spacer()
               
                
                
                Text("Guess the Hangul!")
                
                    .font(.largeTitle.bold())
                
                    .foregroundColor(.white)
                
                VStack(spacing:30) {
                    
                    
                    VStack {
                        
                        Text("Choose a word that matches each other")
                        
                            .foregroundColor(.secondary)
    
                            .font(.subheadline.weight(.heavy))
                        
                        
                        
                        Text(words[correctAnswer])
                        
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    
                    
                    
                    ForEach(0..<3) { number in
                        
                        Button {
                            
                            flagTapped(number)
                            
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
                    .fullScreenCover(isPresented: $shouldShowOnboarding, content: { OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
                    })
                }
                
                .frame(maxWidth: .infinity)
                
                .padding(.vertical, 20)
                
                .background(.regularMaterial)
                
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                
                
                Text("Score: \(score)")
                
                    .foregroundColor(.white)
                
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
    
    func flagTapped(_ number:Int) {
        
        tappedBox = words[number]
        
        showingScore = true
        
        gameCount += 1
        
        
        
        if number == correctAnswer {
            
            score += 10
            
            
            scoreTitle  = isLastRound ? "Game Over" : "Correct!"
            
            scoreMessage = isLastRound ? "Your final score is \(score)" : "Your score is \(score) "
            
        } else {
            
            scoreTitle = isLastRound ? "Game Over" : "wrong answer"
            
            scoreMessage = "The answer you chose mean \(words[number]) in Korean."
            
        }
        
        
        
        alertAction = isLastRound ? "Restart" : "Confirm"
        
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



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
        
    }
    
}
