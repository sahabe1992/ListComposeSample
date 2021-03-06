//
//  SceneDelegate.swift
//  berita
//
//  Created by Ming Geng Choi on 25/6/21.
//

import UIKit
import SwiftUI
import ComposableArchitecture
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: windowScene)
//        let rootView = AppView(store: Store(initialState: AppState(home:HomeViewState(title: Tab.home.rawValue) , sections: SectionsViewState(title: Tab.sections.rawValue), bookmark: BookmarkViewState(title: Tab.bookmarks.rawValue), profile: ProfileViewState(title: Tab.profile.rawValue)), reducer: appRedducer, environment: AppEnvironment(getLandingData: dataManager.landingRepo.getAll, getComponentData: dataManager.landingRepo.getComponentData(id:viewMode:), mainQueue: .main)), currentTab: Tab.home)
//        let splash = SplashView(store: Store(initialState: SplashViewState(splashLogoImage: "logo"), reducer: splashViewReducer, environment: SplashViewEnvironment( mainQueue: .main)), backgroundColor: "#d22d28")
//
//        window.rootViewController = UIHostingController(rootView: splash) // <--- this here
//        self.window = window
//        window.makeKeyAndVisible()
        
        
//        let store: Store<AppState, AppAction> = .init(initialState: AppState(loadingState: LoadingState.Loading, sections: SectionsViewState(title: "Section"), bookmark: BookmarkViewState(title: "Bookmark"), profile: ProfileViewState(title: "Profile")), reducer: appRedducer, environment: AppEnvironment(getLandingData: dataManager.landingRepo.getLandingPage, getComponentData: dataManager.landingRepo.getComponentData(lazyCompo:), mainQueue: .main))
        
        let contentView = AppListView(store: Store(initialState: ListState(list:
                                                                            [
                                                                                ListItemState.incrementState(IncrementState.init(id: 0, count: 0)),
                                                                                ListItemState.DecrementState(DecrementState.init(id: 1, count: 0)),
                                                                                ListItemState.incrementState(IncrementState.init(id: 2, count: 0)),
                                                                                ListItemState.DecrementState(DecrementState.init(id: 3, count: 0)),
                                                                                ListItemState.incrementState(IncrementState.init(id: 4, count: 0)),
                                                                                ListItemState.DecrementState(DecrementState.init(id: 5, count: 0)),
                                                                            ]), reducer: ListReducer, environment: AppListEnvironment()))

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


//class MyHostingController<Content>: UIHostingController<Content> where Content : View {
//    
//    var viewStore: ViewStore<AppState, AppAction>
//        
//    init(viewStore: ViewStore<AppState, AppAction>, rootView: Content) {
//        self.viewStore = viewStore
//        super.init(rootView: rootView)
//    }
//    
//    @objc required dynamic init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
