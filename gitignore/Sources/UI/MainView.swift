import SwiftUI


struct ContentView: View {

    var body: some View {
        NavigationView{
            NavigationListView()
            
            MainView(text: "야옹")
        }
        .frame(minWidth: 600, minHeight: 400)
        .background(ColorManager.backgroundColor)
    }
}

struct Navigation : View{
    var body: some View{
        Text("List")
    }
}
struct MainView : View{
    let text : String
    
    var body: some View{
        Text(text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
