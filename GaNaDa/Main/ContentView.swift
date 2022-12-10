import SwiftUI



import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
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
            
            
        }.font(.headline)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
