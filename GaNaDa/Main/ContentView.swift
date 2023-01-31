//MARK: - 탭뷰 부분
import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {  // tag랑 같이 씀
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
            SearchView()
                .tag(2)
                .tabItem {
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }
        }.font(.headline)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
