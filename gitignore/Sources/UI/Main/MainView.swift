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
import gitignoreView

//MARK: - MainView
struct MainView: View {
    
    let store : Store<MainState,MainAction>
    
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
                    TitleLogo()
                    HStack{
                        TextField(
                            "운영체제, 개발환경(IDE), 프로그래밍 언어 검색",
                            text: viewStore.binding(
                                get: \.searchQuery,send: MainAction.searchQueryChanged
                            ), onCommit: {
                                viewStore.send(MainAction.returnKeyTapTagChoose)
                            }
                        )
                        .textFieldStyle(gitignoreTextfieldStyle())
                        .overlay(alignment: .topLeading){
                            VStack{
                                Spacer(minLength: 50)
                                TagView(tags: Array(viewStore.userChooseTag), isEnabled: true)
                                    .frame(width: 400)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .overlay(alignment: .topLeading) {
                            VStack{
                                Spacer(minLength: 50)
                                if !viewStore.liststatus{
                                    SearchList(list: viewStore.inquiryListString)
                                }
                            }
                        }
                        Button(action: { print("생성")}, label: {
                            Text("생성")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                        })
                        .buttonStyle(CreateButtonStyle())
                    }
                    .padding(.top,30)
                }
                Spacer()
            }.onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
