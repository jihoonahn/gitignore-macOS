import SwiftUI
import ComposableArchitecture
import UIUtil
import gitignoreView

//MARK: - MainView
struct MainView: View {
    
    let store : Store<MainState,MainAction>
    
    public init(store: Store<MainState, MainAction>) {
        self.store = store
    }
    
    struct ViewState : Equatable{
        var searchQuery : String
        var addSheetStatus : Bool
        var editSheetStatus : Bool
        var liststatus : Bool
        var userChooseTag : Set<String>
        
        init(state : MainState){
            searchQuery = state.searchQuery
            addSheetStatus = state.addSheetStatus
            editSheetStatus = state.editSheetStatus
            liststatus = state.liststatus
            userChooseTag = state.userChooseTag
        }
    }
    
    var body: some View {
        Color.backgroundColor
            .ignoresSafeArea()
            .padding(.leading,-10)
        
        WithViewStore(self.store.scope(state: ViewState.init)) { viewStore in
            VStack{
                HStack{
                    Spacer()
                    Button(action: {viewStore.send(.editSheetButtonDidTap)}, label: {
                        Image(systemName: "square.and.pencil")
                            .font(.title2)
                    })
                    .sheet(isPresented: viewStore.binding(
                        get: \.editSheetStatus ,send: MainAction.editSheetButtonDidTap)){
                            EditSheetView(store: store)
                    }
                    .padding(5)
                    .buttonStyle(ToolBarButtonStyle())

                    Button(action: {viewStore.send(.addSheetButtonDidTap)}, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    })
                    .sheet(isPresented: viewStore.binding(
                        get: \.addSheetStatus,send: MainAction.addSheetButtonDidTap)){
                            AddSheetView(store: store)
                    }
                    .padding(5)
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
        }.frame(maxWidth: .infinity , maxHeight: .infinity)
    }
}
