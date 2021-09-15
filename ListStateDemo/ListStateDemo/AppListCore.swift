//
//  AppListCore.swift
//  ListStateDemo
//
//  Created by Srijan on 14/09/21.
//

import Foundation
import ComposableArchitecture

enum ListItemState: Equatable{
    case incrementState(IncrementState)
    case DecrementState(DecrementState)
}
enum ListItemAction{
    case incrementAction(IncrementAction)
    case decrementAction(DecrementAction)
    
}
struct ListState: Equatable{
    var list :IdentifiedArrayOf<ListItemStateType>
}
enum ListAction{
    case action(id:Int, actions:ListItemTypeAction)
}

struct ListItemStateType : Identifiable,Equatable {
    var id : Int
    var state : ListItemState
    
}
enum ListItemTypeAction {
    case listItemAction(ListItemAction)
}
//enum actions{
//    case adderAction(IncrementAction)
//}
struct AppListEnvironment{}


let listItemReducer = Reducer<ListItemState, ListItemAction, AppListEnvironment>.combine(
    InctrementReducer.pullback(state: /ListItemState.incrementState, action: /ListItemAction.incrementAction, environment: {_ in IncrementEnvironment()}),
    DecrementReducer.pullback(state: /ListItemState.DecrementState, action: /ListItemAction.decrementAction, environment: {_ in DecrementEnvironment()})
)

let listItemTypeReducer = Reducer<ListItemStateType, ListItemTypeAction, AppListEnvironment>.combine(
    listItemReducer.pullback(state: \ListItemStateType.state, action: /ListItemTypeAction.listItemAction, environment: {_ in AppListEnvironment()})
)

let ListReducer : Reducer<ListState, ListAction,AppListEnvironment> = listItemTypeReducer.forEach(state: \ListState.list, action: /ListAction.action) { env in
    AppListEnvironment()
}




//let ListTypeReducer : Reducer<ListState, ListAction,AppListEnvironment> = listItemReducer.forEach(state: \ListState.list, action: /ListAction.action) { env in
//    AppListEnvironment()
//}
//let listReducer : Reducer<AppListState, AppListActions, Void> = listItemReducer.forEach(state:/AppListState.list, action: /AppListActions.listItemAction, environment: {_ in AppListEnvironment()})

//let listReducer : Reducer<AppListState, AppListActions, Void> = listItemReducer.forEach(state: /AppListState.list, action: /AppListActions.listItemAction, environment: {env in })
