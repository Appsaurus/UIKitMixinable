//
//  MixinableAppDelegate.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

import UIKit

public protocol UIApplicationDelegateLifeCycle: UIApplicationDelegate, LifeCycle{
    func didInit()
}

extension UIApplicationDelegateLifeCycle {
    public var window: UIWindow? {
        return UIApplication.shared.delegate?.window ?? nil
    }
}

open class UIApplicationDelegateMixin<Mixable>: Mixin<Mixable> & UIApplicationDelegateLifeCycle{
    open func didInit() {}

    open func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        print("NOTIFICATION \(notification)")
    }
    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print("NOTIFICATION \(userInfo)")
    }
    open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("deviceToken \(deviceToken)")
    }

    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("NOTIFICATION \(userInfo)")
    }
}

public protocol UIApplicationDelegateMixinable: Mixinable {}
