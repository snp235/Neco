import SwiftUI

struct Tab: View {
    var body: some View {
        VStack(spacing: 0) {
            
            TabView {
            
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                        
                    }

                Search()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }

                VideoView()
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text("Learn")
                    }

                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                
                    }
                
            }.overlay {
                VStack{
                Spacer()

                }
                
            }
        
            .accentColor(Color.green)
        }
        
    }
}


struct HomeView: View {
    var body: some View {
        //Text("Home Screen")
        VegetableGardenView()
    }
}

struct SearchView: View {
    var body: some View {
        Search()
    }
}

struct VideoView: View {
    var body: some View {
       // Text("Videos Screen")
        LearnView()
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings Screen")
    }
}


struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
