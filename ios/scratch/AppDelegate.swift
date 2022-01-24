//
//  AppDelegate.swift
//  scratch
//
//  Created by Henrique Ladeira on 23/01/22.
//

import UIKit
import React

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var bridge: RCTBridge?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let viewBridge = createBridgeIfNeeded()
        let rootView: RCTRootView = RCTRootView(
            bridge: viewBridge,
            moduleName: "scratch",
            initialProperties: nil)

        self.window = UIWindow.init()
        let rootViewController = UIViewController.init()
        rootViewController.view = rootView
        self.window!.rootViewController = rootViewController
        
        return true
    }

    func createBridgeIfNeeded() -> RCTBridge {
        if bridge == nil {
            bridge = RCTBridge.init(delegate: self, launchOptions: nil)
        }
        return bridge!
    }

}

extension AppDelegate: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        #if DEBUG
            return URL(string: "http://localhost:8081/index.bundle?platform=ios")
        #else
            return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
        #endif
    }
}
