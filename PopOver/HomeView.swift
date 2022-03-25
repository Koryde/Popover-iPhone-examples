import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        TabView{
            MainView1()
                .tabItem{
                    Label("Example 1", systemImage: "1.square")
                }
            
            MainView2()
                .tabItem{
                    Label("Example 2", systemImage: "2.square")
                }
        }
        .accentColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
