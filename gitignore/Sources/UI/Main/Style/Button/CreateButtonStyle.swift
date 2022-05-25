//
//  CreateButtonStyle.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/24.
//

import SwiftUI

struct CreateButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width:50, height: 40)
            .background(.orange)
            .buttonStyle(PlainButtonStyle())
    }
    
    //MARK: - Initalizer
     init(){}
}


