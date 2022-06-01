import ComposableArchitecture
import Effects
import Local
struct RootState: Equatable{
    var mainState = MainState()
}

enum RootAction{
    case mainAction(MainAction)
}

struct RootEnvironment{}

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    mainReducer.pullback(
        state:\.mainState,
        action: /RootAction.mainAction,
        environment: {_ in
                .init(
                    locals: {ServiceCoreData()},
                    effects: { ServiceEffect()},
                    mainQueue: {.main}
                )
        }
    ),
    
    Reducer{ _ , action, _ in
        switch action {
        case .mainAction:
            return .none
        }
    }
)
