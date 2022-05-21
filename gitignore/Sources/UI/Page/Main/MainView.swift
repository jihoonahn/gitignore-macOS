//
//  MainView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture
import UIUtil
import TagListView

//MARK: - MainView
struct MainView: View {
    let store : Store<MainState,MainAction>
    //MARK: - Legacy
    
    @State var text = ""

    var body: some View {
        Color.backgroundColor
            .ignoresSafeArea()
            .padding(.leading,-10)
        
        WithViewStore(self.store) { viewStore in
            VStack{
                HStack{
                    Spacer()
                    Button(action: {print("add")}, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    })
                    .buttonStyle(ToolBarButtonStyle())
                }
                .padding()
                Spacer()
                
                VStack{
                    Image("HomeLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 100)
                    Text("프로젝트에 꼭 맞는 .gitignore 파일을 더 빠르게 생성하세요!")
                        .font(.system(size: 13, weight: .medium, design: .default))
                        .padding(.top, 20)
                    HStack{
                        TextField(
                            "운영체제, 개발환경(IDE), 프로그래밍 언어 검색",
                            text: $text
                        ).textFieldStyle(gitignoreTextfieldStyle())
                            .frame(width: 300, height: 40)
                        
                        Button(action: { print("생성")}, label: {
                            Text("생성")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                        })
                        .frame(width:50, height: 40)
                        .background(.orange)
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top,30)
                }
                TagView(tags: ["swift","swift Package Manger"])
                .frame(width: 400)
                .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
        }
    }
}


