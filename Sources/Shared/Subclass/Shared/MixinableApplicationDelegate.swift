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

}
