//
//  RootFeacture.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/12.
//

import ComposableArchitecture

enum RootState : Equatable{
    case home
    
    public init() {self = .home}
}

enum RootAction{
    
}

struct RootEnvironment{}

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    


)
