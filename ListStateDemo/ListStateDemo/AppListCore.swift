//
//  AppListCore.swift
//  ListStateDemo
//
//  Created by Srijan on 14/09/21.
//

import Foundation
import ComposableArchitecture

enum ListItemState: Equatable, Identifiable{
    case incrementState(IncrementState)
    case DecrementState(DecrementState)
    
    var id:Int{
        get{
            switch(self){
            case .incrementState(let state):
                return state.id
            case .DecrementState(let state):
                return state.id
            }
        }
    }
}
enum ListItemAction{
    case incrementAction(IncrementAction)
    case decrementAction(DecrementAction)
    
    
}
struct ListState: Equatable{
    var list :IdentifiedArrayOf<ListItemState>
}
enum ListAction{
    case action(id:Int, actions:ListItemAction)
    case onAppear
}

struct AppListEnvironment{}


let listItemReducer = Reducer<ListItemState, ListItemAction, AppListEnvironment>.combine(
    InctrementReducer.pullback(state: /ListItemState.incrementState, action: /ListItemAction.incrementAction, environment: {_ in IncrementEnvironment()}),
    DecrementReducer.pullback(state: /ListItemState.DecrementState, action: /ListItemAction.decrementAction, environment: {_ in DecrementEnvironment()})
)
let ListReducer = Reducer<ListState, ListAction, AppListEnvironment>.combine(
    listItemReducer.forEach(
        state: \ListState.list,
        action: /ListAction.action,
    environment: { _ in AppListEnvironment() }
  ),
  Reducer { state, action, environment in
    switch action {
    case .onAppear:
        print("Appear")
      return .none


    case .action(id: let id, actions: let actions):
        return .none
    }
  }
)
