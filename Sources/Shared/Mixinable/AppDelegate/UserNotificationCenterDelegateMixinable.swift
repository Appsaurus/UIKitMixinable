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
open class UNUserNotificationCenterDelegateMixin<Mixable>: UIApplicationDelegateMixin<Mixable> & UNUserNotificationCenterDelegate{}

@available(iOS 10, *)
public protocol UNUserNotificationCenterDelegateLifeCycle: UNUserNotificationCenterDelegate, UIApplicationDelegateLifeCycle{}

@available(iOS 10, *)
public protocol UNUserNotificationCenterDelegateMixinable: UIApplicationDelegateMixinable {
    func completionHandlerOptions(for notification: UNNotification) -> UNNotificationPresentationOptions
}

@available(iOS 10, *)
extension UNUserNotificationCenterDelegateMixinable {

    public func completionHandlerOptions(for notification: UNNotification) -> UNNotificationPresentationOptions {
        return [.alert, .badge, .sound]
    }
}
