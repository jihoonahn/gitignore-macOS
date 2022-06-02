//
//  SwiftUIView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/06/02.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack{
            LottieView(fileName: "73178-question-boy-orange")
                .frame(width: 400, height: 275)
            Text("리스트에 저장된 값이 없습니다")
                .font(.title2)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
