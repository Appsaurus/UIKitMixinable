//
//  MixinableApplicationDelegate.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 3/22/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

import UIKit

open class MixinableApplicationDelegate: UIResponder, UIApplicationDelegate, UIApplicationDelegateMixinable {
    open lazy var mixins: [LifeCycle] = self.createMixins()

    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.applicationDelegate(self)
    }

    open var window: UIWindow?

    override public init() {
        super.init()
        didInit()
    }

    open func didInit() {
        mix_didInit()
    }

    open func applicationDidFinishLaunching(_ application: UIApplication) {
        mix_applicationDidFinishLaunching(application)
    }

    open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return !mix_application(application, willFinishLaunchingWithOptions: launchOptions).contains(false)
    }

    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // If any mixin returns false, we return false
        return !mix_application(application, didFinishLaunchingWithOptions: launchOptions).contains(false)
    }

    open func applicationWillResignActive(_ application: UIApplication) {
        mix_applicationWillResignActive(application)
    }

    open func applicationDidEnterBackground(_ application: UIApplication) {
        mix_applicationDidEnterBackground(application)
    }

    open func applicationWillEnterForeground(_ application: UIApplication) {
        mix_applicationWillEnterForeground(application)
    }

    open func applicationDidBecomeActive(_ application: UIApplication) {
        mix_applicationDidBecomeActive(application)
    }

    open func applicationWillTerminate(_ application: UIApplication) {
        mix_applicationWillTerminate(application)
    }

    open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        mix_applicationDidReceiveMemoryWarning(application)
    }

    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return !mix_application(app, open: url, options: options).contains(false)
    }

    open func applicationSignificantTimeChange(_ application: UIApplication) {
        mix_applicationSignificantTimeChange(application)
    }

    open func application(_ application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect) {
        mix_application(application, willChangeStatusBarFrame: newStatusBarFrame)
    }


    //MARK: Notification Registration

    open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

    }

    open func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {

    }

    open func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

    }

    // MARK: Notifications Handling
    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        mix_application(application, didReceiveRemoteNotification: userInfo)
    }

    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        mix_application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }

    // MARK: Application Shortcut Items
    open func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        mix_application(application, performActionFor: shortcutItem, completionHandler: completionHandler)
    }

    open func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        mix_application(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler)
    }

    open func application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?, reply: @escaping ([AnyHashable : Any]?) -> Void) {
        mix_application(application, handleWatchKitExtensionRequest: userInfo, reply: reply)
    }

}
