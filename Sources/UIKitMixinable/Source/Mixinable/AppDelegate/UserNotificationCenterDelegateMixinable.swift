//
//  UserNotificationCenterDelegateMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 3/26/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

#if !os(watchOS)
import UIKit
import UserNotifications

@available(iOS 10, *)
open class UNUserNotificationCenterDelegateMixin<Mixable>: UIApplicationDelegateMixin<Mixable>, UNUserNotificationCenterDelegateLifeCycle{

    open func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {}

    #if os(iOS)
    open func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {}

    open func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {}
    #endif
}

@available(iOS 10, *)
public protocol UNUserNotificationCenterDelegateLifeCycle: UNUserNotificationCenterDelegate, UIApplicationDelegateLifeCycle{}

@available(iOS 10, *)
public protocol UNUserNotificationCenterDelegateMixinable: UIApplicationDelegateMixinable & UNUserNotificationCenterDelegate {
    func completionHandlerOptions(for notification: UNNotification) -> UNNotificationPresentationOptions
}

@available(iOS 10, *)
extension UNUserNotificationCenterDelegateMixinable {

    public func completionHandlerOptions(for notification: UNNotification) -> UNNotificationPresentationOptions {
        #if os(tvOS)
        return [.badge, .sound]
        #else
        return [.alert, .badge, .sound]
        #endif
        
    }
}

#endif
