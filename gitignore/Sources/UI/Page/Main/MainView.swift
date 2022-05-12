//
//  MainView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    let store : Store<MainState,MainAction>
    @State var text = ""
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack{
                
                Image("HomeLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 180)
                    .padding()
                TextField(
                  "운영체제, 개발환경(IDE), 프로그래밍 언어 검색",
                  text: $text
                )
                
            }
        }
    }
}

