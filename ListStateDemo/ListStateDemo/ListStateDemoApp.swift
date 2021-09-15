//
//  ListStateDemoApp.swift
//  ListStateDemo
//
//  Created by Srijan on 14/09/21.
//

import SwiftUI
import ComposableArchitecture
@main
struct ListStateDemoApp: App {
    var body: some Scene {
        WindowGroup {
            AppListView(store: Store(initialState: ListState(list: [ListItemStateType(id: 0, state: ListItemState.incrementState(IncrementState.init(id: 0, count: 0)))]), reducer: ListReducer, environment: AppListEnvironment()))
        }
    }
}
