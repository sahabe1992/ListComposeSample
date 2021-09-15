//
//  AppListView.swift
//  ListStateDemo
//
//  Created by Srijan on 14/09/21.
//

import SwiftUI
import ComposableArchitecture
struct AppListView: View {
    let store: Store<ListState, ListAction>
    
    var body: some View {
        WithViewStore(self.store) { vs in
                
        
            
                ForEachStore(
                    self.store.scope(state: \.list, action:ListAction.action(id:actions:))
                ) { todoStore in
                    
                    SwitchStore(todoStore) {
                        CaseLet(state: /ListItemState.incrementState, action: ListItemAction.incrementAction) { incrementStore in
                            IncrementView(store: incrementStore)
                        }
                        CaseLet(state: /ListItemState.DecrementState, action: ListItemAction.decrementAction) {
                            decrementStore in
                            DecrementView(store: decrementStore)
                        }
                    }
                    
            }
        
        
    }
}
}

//struct AppListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppListView(store: Store(initialState: ListState(list: [.incrementState(IncrementState(id: 1, count: 2)),.DecrementState(DecrementState(id: 0, count: 10)),.incrementState(IncrementState(id: 2, count: 1))]), reducer: ListReducer, environment: AppListEnvironment()))
//    }
//}
