//
//  SwiftUIView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/06/02.
//

import SwiftUI

struct NoList: View {
    var body: some View {
        VStack{
            LottieView(fileName: "73178-question-boy-orange")
                .frame(width: 400, height: 275)
            Text("저장된 gitignore가 없어요!")
                .font(.title2)
        }
    }
}
