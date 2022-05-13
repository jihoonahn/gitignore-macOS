//
//  MainView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture

//MARK: - MainView
struct MainView: View {
    let store : Store<MainState,MainAction>
    
    @State var text = ""
    var body: some View {
        Color.backgroundColor
            .ignoresSafeArea()
            .padding(.leading,-10)
        
        WithViewStore(self.store) { viewStore in
            HStack{
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {print("add")}, label: {
                            Image(systemName: "plus")
                                .font(.title2)
                        })
                        .buttonStyle(ToolBarButtonStyle())
                        Button(action: {print("side")}, label: {
                            Image(systemName: "sidebar.right")
                                .font(.title2)
                        })
                        .buttonStyle(ToolBarButtonStyle())
                    }
                    .padding()
                    .ignoresSafeArea(edges: .top)
                    Spacer()

                    VStack{
                        Image("HomeLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 100)
                        Text("프로젝트에 꼭 맞는 .gitignore 파일을 더 빠르게 생성하세요!")
                            .font(.system(size: 13, weight: .medium, design: .default))
                            .padding(.top, 20)
                        TextField(
                            "운영체제, 개발환경(IDE), 프로그래밍 언어 검색",
                            text: $text
                        ).textFieldStyle(gitignoreTextfieldStyle())
                            .frame(width: 300, height: 40)
                            .padding(.top,30)
                    }
                    Spacer()
                }
                           
                ExpandListView()
                    .frame(width: 200)
                    .background(BlurView())
            }
        }
    }
}


//MARK: - ExpandView
struct ExpandListView : View{
    var body: some View{
        HStack{
            Divider()
            
            VStack(spacing: 25){
                HStack{
                    Text("Bookmark")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            .ignoresSafeArea(edges: .top)
            .frame(maxWidth: .infinity)

        }
    }
}
