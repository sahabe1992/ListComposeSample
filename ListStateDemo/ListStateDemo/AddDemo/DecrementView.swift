//
//  DisplayCount.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 03/08/21.
//

import SwiftUI
import ComposableArchitecture

struct DecrementView: View {
    
    let store: Store<DecrementState, DecrementAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack{
                Text("Decremented value \(viewStore.state.count)")
                Button("Decrement") {
                    viewStore.send(DecrementAction.decrementCount)
                }.padding().buttonStyle(BorderlessButtonStyle())
                Button("Reset") {
                    viewStore.send(DecrementAction.reset)
                }.padding().buttonStyle(BorderlessButtonStyle())
                NavigationLink(destination: Text("Second View"), isActive: .constant(false)) { EmptyView() }
                Button("Tap to show detail") {
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
    }
}

struct DisplayCount_Previews: PreviewProvider {
    static var previews: some View {
        DecrementView(
            store:
                Store(
                    initialState: DecrementState(id: 0),
                    reducer: DecrementReducer,
                    environment: DecrementEnvironment()
                )
        )
    }
}


struct DecrementState: Equatable, Identifiable {
    var id: Int
    var count : Int = 0
}

enum DecrementAction {
    case decrementCount
    case reset
}

struct DecrementEnvironment {
}

let DecrementReducer = Reducer<DecrementState, DecrementAction,DecrementEnvironment >{ state, action, env in
    switch(action){
        case .decrementCount:
            state.count = state.count - 1
            return .none
    case .reset:
        state.count = 10
        return .none
    }
}
