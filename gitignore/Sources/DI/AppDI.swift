import Swinject

extension Container{
    func registerDependency(){
        registerView()
    }
    
    private func registerView(){
        self.register(RootView.self){ r in
            return RootView()
        }
    }
}
