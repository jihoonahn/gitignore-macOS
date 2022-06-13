import SwiftUI
import ComposableArchitecture

struct TabButton: View {
    var image : String
    var title : String
    
    let store : Store<TabBarState, TabBarAction>
    
    var body: some View {
        WithViewStore(self.store){ viewStore in
            Button(action: {withAnimation{viewStore.send(TabBarAction.selectTabBarButton(title))}}, label: {
                VStack(spacing: 7){
                    Image(systemName: image)
                        .font(.system(size: 16,weight: .semibold))
                        .foregroundColor(viewStore.selectedTab == title ? .white : .gray)
                    Text(title.localized())
                        .fontWeight(.semibold)
                        .font(.system(size: 11))
                        .foregroundColor(viewStore.selectedTab == title ? .white : .gray)
                }
                .padding(.vertical,8)
                .frame(width: 70)
                .contentShape(Rectangle())
                .background(Color.primary.opacity(viewStore.selectedTab == title ? 0.15: 0))
                .cornerRadius(10)
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
}
