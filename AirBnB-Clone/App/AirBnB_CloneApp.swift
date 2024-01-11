//
//  AirBnB_CloneApp.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 9.1.24..
//

import UIKit
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct AirBnB_CloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
