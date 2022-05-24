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
    
    struct ViewState: Equatable{
        var searchQuery = ""
        var liststatus : Bool = true
        var inquiryListString : [String] = .init()
        var gitignoreListString : [String] = .init()
        var userChooseTag : Set<String> = .init()
        
        init(state : MainState){
            self.searchQuery = state.searchQuery
            self.liststatus = state.liststatus
            self.inquiryListString = state.inquiryListString
            self.gitignoreListString = state.gitignoreListString
            self.userChooseTag = state.userChooseTag
        }
    }
    
    public init(store: Store<MainState, MainAction>) {
        self.store = store
    }
    
    var body: some View {
        Color.backgroundColor
            .ignoresSafeArea()
            .padding(.leading,-10)
        
        WithViewStore(self.store.scope(state: ViewState.init)) { viewStore in
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
                                viewStore.send(MainAction.tapTagChoose(0))
                            }
                        )
                        .textFieldStyle(gitignoreTextfieldStyle())
                        .overlay(alignment: .topLeading){
                            VStack{
                                Spacer(minLength: 50)
                                TagMainView(store: store)
                                    .frame(width: 400)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .overlay(alignment: .topLeading) {
                            VStack{
                                Spacer(minLength: 50)
                                if !viewStore.liststatus{
                                    SearchList(store: store)
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
