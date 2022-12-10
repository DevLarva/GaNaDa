import SwiftUI



import SwiftUI

struct ContentView: View {
    private enum Tab: Hashable {
        case Memo
        case Main
    }
    
    @State private var selectedTab: Tab = .Memo
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView()
                .tag(0)
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.fill")
                }
            MemoMain()
                .tag(1) 
                .tabItem {
                    Text("Vocabulary")
                    Image(systemName: "square.and.pencil")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
