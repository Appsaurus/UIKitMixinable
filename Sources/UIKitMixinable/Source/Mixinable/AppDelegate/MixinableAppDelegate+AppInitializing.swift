//
//  MixinableAppDelegate+AppInitializing.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

#if !os(watchOS)
import UIKit

extension MixinableAppDelegate {

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        return appDelegateMixins.compactMap { $0.application?(application, willFinishLaunchingWithOptions: launchOptions) }.contains(true)
    }

    @available(iOS 3.0, *)
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        return appDelegateMixins.compactMap { $0.application?(application, didFinishLaunchingWithOptions: launchOptions) }.contains(true)        
    }

    @available(iOS 2.0, *)
    open func applicationDidFinishLaunching(_ application: UIApplication) {
        appDelegateMixins.forEach { $0.applicationDidFinishLaunching?(application) }
    }
}
#endif
