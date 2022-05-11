//
//  Home.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI

//MARK: - Screen
var screen = NSScreen.main!.visibleFrame

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        HStack{
            VStack{
                TabButton(image: "house.fill", title: "Home", selectedTab: $homeData.selectedTab)
                TabButton(image: "note.text", title: "List", selectedTab: $homeData.selectedTab)
                Spacer()
                TabButton(image: "exclamationmark.circle.fill", title: "Issue", selectedTab: $homeData.selectedTab)
            }
            .padding()
            .padding(.top,35)
            .background(BlurView())
            
            ZStack{
                switch homeData.selectedTab{
                case "Home": MainView()
                case "List": ListView()
                case "Issue": IssueView()
                default: Text("")
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(minWidth: 600, minHeight: 400)
        .environmentObject(homeData)
    }
}
