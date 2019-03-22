//
//  AppDelegateMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 3/22/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

#if canImport(UIKit)
import UIKit

open class UIApplicationDelegateMixin: Mixin<UIApplicationDelegate> & UIApplicationDelegateLifeCycle{
    open func didInit() {}

    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        return true
    }

    open func applicationWillResignActive(_ application: UIApplication) {}

    open func applicationDidEnterBackground(_ application: UIApplication) {}

    open func applicationWillEnterForeground(_ application: UIApplication) {}

    open func applicationDidBecomeActive(_ application: UIApplication) {}

    open func applicationWillTerminate(_ application: UIApplication) {}
}

public protocol UIApplicationDelegateLifeCycle: LifeCycle{

    func didInit()
    // Override point for customization after application launch.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool

    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    func applicationWillResignActive(_ application: UIApplication)

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    func applicationDidEnterBackground(_ application: UIApplication)

    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    func applicationWillEnterForeground(_ application: UIApplication)

    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    func applicationDidBecomeActive(_ application: UIApplication)

    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    func applicationWillTerminate(_ application: UIApplication)
}

public protocol UIApplicationDelegateMixinable: Mixinable {}

extension UIApplicationDelegateMixinable{

    public var appDelegateMixins: [UIApplicationDelegateLifeCycle]{
        return mixins.map{$0 as? UIApplicationDelegateLifeCycle}.compactMap{$0}
    }

    public func mix_didInit() {
        appDelegateMixins.forEach{$0.didInit()}
    }

    @discardableResult
    public func mix_application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> [Bool]{
        return appDelegateMixins.map{$0.application(application, didFinishLaunchingWithOptions: launchOptions)}
    }
    public func mix_applicationWillResignActive(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationWillResignActive(application)}
    }
    public func mix_applicationDidEnterBackground(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationDidEnterBackground(application)}
    }
    public func mix_applicationWillEnterForeground(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationWillEnterForeground(application)}
    }
    public func mix_applicationDidBecomeActive(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationDidBecomeActive(application)}
    }

    public func mix_applicationWillTerminate(_ application: UIApplication){
        appDelegateMixins.forEach{$0.applicationWillTerminate(application)}
    }
}
#endif
