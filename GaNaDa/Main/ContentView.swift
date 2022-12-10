import SwiftUI



import SwiftUI

struct ContentView: View {
    private enum Tab: Hashable {
        case MainView
        case MemoMain
    }
    
    @State private var selectedTab: Tab = .MemoMain
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView()
                .tag(1)
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.fill")
                } 
            
            MemoMain()
                .tag(0)
                .tabItem {
                    Text("Vocabulary")
                    Image(systemName: "square.and.pencil")
                }
            
            
        }.font(.headline)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
