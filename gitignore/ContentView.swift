//
//  ContentView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ListView()
            MainView()
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}
struct ListView : View{
    var body: some View{
        Text("List")
    }
}

struct MainView : View{
    var body: some View{
        Text("Main")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewLayout(.fixed(width: 568, height: 320))
    }
}
