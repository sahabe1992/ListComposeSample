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
//            List {
                
        
                
                ForEachStore(
                    self.store.scope(state: \.list, action:ListAction.action(id:actions:))
                ) { todoStore in
                    
                    WithViewStore(todoStore){ childState in

                        if (childState.state == .incrementState){
                            IncrementView(store: store.scope(state: {_ in childState.st}))
                        }

                        
                        switch childState.state {
                        case .incrementState(let state):
                            View
                            IncrementView(store: store.scope(state:{_ in state}, action: /ListItemTypeAction.listItemAction))
                        }
                      
                        
                    }.debug()
                    
//                    SwitchStore(todoStore) {
//                        CaseLet(state: /ListItemStateType.incrementState, action: ListItemAction.incrementAction) { loggedInStore in
//                            IncrementView(store: loggedInStore)
//                          }
//                          CaseLet(state: /ListItemState.DecrementState, action: ListItemAction.decrementAction) { loggedOutStore in
//                            DecrementView(store: loggedOutStore)
//                          }
//                        }
//                }
                
//            ForEach(vs.state.list) { childState in
//                switch childState {
//                case .incrementState(let state):
//                    IncrementView(store: store.scope(state:{_ in state}, action: /ListAction.action(id: actions:)))
////                    IncrementView(store: Store(initialState: state, reducer: InctrementReducer, environment: IncrementEnvironment()))
//
//                case .DecrementState(let state):
////                    DecrementView(store: Store(initialState: state, reducer: DecrementReducer, environment: DecrementEnvironment()))
//                    DecrementView(store: store.scope(state: { _ in
//                        state
//                    }, action: {_ in ListAction.action(id: childState.id, actions: ListItemAction.decrementAction)}))
//                }
//            }
            }
//        }
        
        
    }
}
}

//struct AppListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppListView(store: Store(initialState: ListState(list: [.incrementState(IncrementState(id: 1, count: 2)),.DecrementState(DecrementState(id: 0, count: 10)),.incrementState(IncrementState(id: 2, count: 1))]), reducer: ListReducer, environment: AppListEnvironment()))
//    }
//}
