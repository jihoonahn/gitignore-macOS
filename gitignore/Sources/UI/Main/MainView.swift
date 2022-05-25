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
    
    public init(store: Store<MainState, MainAction>) {
        self.store = store
    }
    
    var body: some View {
        Color.backgroundColor
            .ignoresSafeArea()
            .padding(.leading,-10)
        
        WithViewStore(self.store) { viewStore in
            VStack{
                HStack{
                    Spacer()
                    Button(action: {viewStore.send(.addButtonClick)}, label: {
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
                        Button(action: {
                            viewStore.send(.createGitignore)
                            if viewStore.createStatus && !viewStore.userChooseTag.isEmpty{
                                viewStore.send(.createGitignoreFile(showSavePanel()))
                            }
                        }, label: {
                            Text("생성")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                        })
                        .buttonStyle(CreateButtonStyle())
                    }
                    .padding(.top,30)
                    TagMainView(store: store)
                        .frame(width: 360)
                        .fixedSize(horizontal: false, vertical: true)
                        .overlay(alignment: .topLeading) {
                            VStack{
                                if !viewStore.liststatus{
                                    SearchList(store: store)
                                        .frame(width: 300, height: 100 )
                                }
                            }
                        }
                }
                Spacer()
            }.onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
    //MARK: - Method
    private func showSavePanel() -> URL? {
        let savePanel = NSSavePanel(nameFieldStringValue: ".gitignore")
        let response = savePanel.runModal()
        return response == .OK ? savePanel.url : nil
    }
}
