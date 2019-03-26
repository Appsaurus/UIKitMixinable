//
//  UserNotificationCenterDelegateMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 3/26/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

import UIKit
import UserNotifications

@available(iOS 10, *)
open class UNUserNotificationCenterDelegateMixin<Mixable>: UIApplicationDelegateMixin<Mixable>, UNUserNotificationCenterDelegateLifeCycle{
    open override func didInit() {
        super.didInit()
//        UNUserNotificationCenter.current().delegate = self
    }

    open func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
print("GOTEM")
    }

    open func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("GOTEM")
    }

    open func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
print("GOTEM")
    }
//    open func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){}
//    open func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void){}
//
//    @available(iOS 12.0, *)
//    open func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?){}
}

@available(iOS 10, *)
public protocol UNUserNotificationCenterDelegateLifeCycle: UNUserNotificationCenterDelegate, UIApplicationDelegateLifeCycle{
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
//    @available(iOS 12.0, *)
//    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?)
}

@available(iOS 10, *)
public protocol UNUserNotificationCenterDelegateMixinable: UIApplicationDelegateMixinable & UNUserNotificationCenterDelegate {
    func completionHandlerOptions(for notification: UNNotification) -> UNNotificationPresentationOptions
}

@available(iOS 10, *)
extension UNUserNotificationCenterDelegateMixinable {

    public func completionHandlerOptions(for notification: UNNotification) -> UNNotificationPresentationOptions {
        return [.alert, .badge, .sound]
    }
}
