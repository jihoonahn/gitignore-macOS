//
//  ContentView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI

struct ContentView: View {
    private let names = ["Homer", "Marge", "Bart", "Lisa"]
    @State private var selection: String?

    var body: some View {
        NavigationView {
            List(selection: $selection) {
                Section(header: Text("The Simpsons")) {
                    ForEach(names, id: \.self) { name in
                        NavigationLink(destination: DetailView(text: name)) {
                            Text(name)
                        }
                    }
                }
            }.listStyle(SidebarListStyle())
            DetailView(text: "Make a selection")
        }
    }
}

struct DetailView: View {
    let text: String

    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewLayout(.fixed(width: 568, height: 320))
    }
}
