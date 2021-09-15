//
//  AdderScreen.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 03/08/21.
//

import SwiftUI
import ComposableArchitecture

struct IncrementView: View {
    let store: Store<IncrementState, IncrementAction>
    @State var isShowingDetailView: Bool = false
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack{
                Text("IncrementValue Count \(viewStore.state.count)")
                Button("Increment") {
                    viewStore.send(IncrementAction.increment)
                }.padding().buttonStyle(BorderlessButtonStyle())
                Button("Reset") {
                    viewStore.send(IncrementAction.reset)
                }.padding().buttonStyle(BorderlessButtonStyle())
                
                NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailView) { EmptyView() }
                Button("Tap to show detail") {
                    self.isShowingDetailView = true
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
    }
}

//struct AdderScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        IncrementView(
//            store: Store(
//                initialState: IncrementState(id: 0),
//                reducer: InctrementReducer,
//                environment: IncrementEnvironment()
//            )
//        )
//    }
//}

struct IncrementState: Equatable, Identifiable {
    var id: Int
    var count : Int = 0
}

enum IncrementAction {
    case increment
    case reset
}

struct IncrementEnvironment {
    
}

let InctrementReducer = Reducer<IncrementState, IncrementAction,IncrementEnvironment >{ state, action, env in
    switch(action){
    case .increment:
        state.count = state.count + 1
        return .none
    case .reset:
        state.count = 0
        return .none
    }
}

