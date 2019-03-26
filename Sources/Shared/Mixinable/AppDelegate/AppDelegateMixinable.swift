//
//  AppDelegateMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 3/22/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

#if canImport(UIKit)
import UIKit

open class UIApplicationDelegateMixin<Mixable>: Mixin<Mixable> & UIApplicationDelegateLifeCycle{
    open func didInit() {}

//    open func applicationDidFinishLaunching(_ application: UIApplication) {}
//
//    open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool { return true }
//
//    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool { return true }
//
//    open func applicationWillResignActive(_ application: UIApplication) {}
//
//    open func applicationDidEnterBackground(_ application: UIApplication) {}
//
//    open func applicationWillEnterForeground(_ application: UIApplication) {}
//
//    open func applicationDidBecomeActive(_ application: UIApplication) {}
//
//    open func applicationWillTerminate(_ application: UIApplication) {}
//
//    open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {}
//
//    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool { return true }
//
//    open func applicationSignificantTimeChange(_ application: UIApplication) {}
//
//    open func application(_ application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect) {}
//
//    //MARK: Notification Registration
//    open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {}
//    open func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {}
//    open func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {}
//
//    //MARK: Notification Handling
//    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {}
//
//    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {}
//
//    open func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {}
//
//    open func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {}
//
//    open func application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?, reply: @escaping ([AnyHashable : Any]?) -> Void) {}


}

public protocol UIApplicationDelegateLifeCycle: UIApplicationDelegate, LifeCycle{

    func didInit()

//    func applicationDidFinishLaunching(_ application: UIApplication)
//
//    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool
//
//    // Override point for customization after application launch.
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
//
//    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//    func applicationWillResignActive(_ application: UIApplication)
//
//    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    func applicationDidEnterBackground(_ application: UIApplication)
//
//    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//    func applicationWillEnterForeground(_ application: UIApplication)
//
//    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    func applicationDidBecomeActive(_ application: UIApplication)
//
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    func applicationWillTerminate(_ application: UIApplication)
//
//    func applicationDidReceiveMemoryWarning(_ application: UIApplication)
//
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
//
//    func applicationSignificantTimeChange(_ application: UIApplication)
//
//    func application(_ application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect)
//
//
//    //MARK: Notification Registration
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
//    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings)
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
//
//    //MARK: Notification Handling
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any])
//
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
//
//    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void)
//
//    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void)
//
//    func application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?, reply: @escaping ([AnyHashable : Any]?) -> Void)
}

public protocol UIApplicationDelegateMixinable: Mixinable {}

extension UIApplicationDelegateMixinable{

    public var appDelegateMixins: [UIApplicationDelegateLifeCycle]{
        return mixins.compactMap{$0 as? UIApplicationDelegateLifeCycle}
    }

    public func mix_didInit() {
        appDelegateMixins.forEach{$0.didInit()}
    }

    public func mix_applicationDidFinishLaunching(_ application: UIApplication) {
        appDelegateMixins.forEach{ $0.applicationDidFinishLaunching?(application) }
    }

    public func mix_application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> [Bool] {
        return appDelegateMixins.compactMap{ $0.application?(application, willFinishLaunchingWithOptions: launchOptions)}
    }

    @discardableResult
    public func mix_application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> [Bool]{
        return appDelegateMixins.compactMap {$0.application?(application, didFinishLaunchingWithOptions: launchOptions) }
    }
    public func mix_applicationWillResignActive(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationWillResignActive?(application)}
    }
    public func mix_applicationDidEnterBackground(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationDidEnterBackground?(application)}
    }
    public func mix_applicationWillEnterForeground(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationWillEnterForeground?(application)}
    }
    public func mix_applicationDidBecomeActive(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationDidBecomeActive?(application)}
    }
    public func mix_applicationWillTerminate(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationWillTerminate?(application)}
    }

    public func mix_applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        appDelegateMixins.forEach { $0.applicationDidReceiveMemoryWarning?(application)}
    }

    public func mix_application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> [Bool] {
        return appDelegateMixins.compactMap { $0.application?(app, open: url, options: options) }
    }

    public func mix_applicationSignificantTimeChange(_ application: UIApplication) {
        appDelegateMixins.forEach { $0.applicationSignificantTimeChange?(application)}
    }

    public func mix_application(_ application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect) {
        appDelegateMixins.forEach { $0.application?(application, willChangeStatusBarFrame: newStatusBarFrame)}
    }

    //MARK: Notification Registration
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appDelegateMixins.forEach { $0.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken) }
    }

    public func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        appDelegateMixins.forEach { $0.application?(application, didRegister: notificationSettings) }
    }

    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        appDelegateMixins.forEach { $0.application?(application, didFailToRegisterForRemoteNotificationsWithError: error) }
    }
    // MARK: Notifications Handling
    public func mix_application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        appDelegateMixins.forEach { $0.application?(application, didReceiveRemoteNotification: userInfo)}
    }

    public func mix_application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        appDelegateMixins.forEach { $0.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)}
    }

    // MARK: Application Shortcut Items
    public func mix_application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        appDelegateMixins.forEach { $0.application?(application, performActionFor: shortcutItem, completionHandler: completionHandler)}
    }

    public func mix_application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        appDelegateMixins.forEach { $0.application?(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler)}
    }

    public func mix_application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?, reply: @escaping ([AnyHashable : Any]?) -> Void) {
        appDelegateMixins.forEach { $0.application?(application, handleWatchKitExtensionRequest: userInfo, reply: reply)}
    }
}
#endif
