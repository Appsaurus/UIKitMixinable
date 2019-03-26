//
//  MixinableAppDelegate.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 3/22/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

import UIKit

open class MixinableAppDelegate: UIResponder, UIApplicationDelegate, Mixinable {
    open var window: UIWindow?

    open lazy var mixins: [LifeCycle] = self.createMixins()
    open lazy var appDelegateMixins: [UIApplicationDelegateLifeCycle] = self.mixins.compactMap{ $0 as? UIApplicationDelegateLifeCycle }

    @available(iOS 10, *)
    open lazy var userNotificationMixins: [UNUserNotificationCenterDelegateLifeCycle] = self.mixins.compactMap{ $0 as? UNUserNotificationCenterDelegateLifeCycle }

    open func createMixins() -> [LifeCycle] {
        return []
    }

    override public init() {
        super.init()
        didInit()
    }

    open func didInit() {

    }
    
    @discardableResult
    internal func apply<T, S>(_ work: (UIApplicationDelegateLifeCycle, @escaping (T) -> Void) -> S?, completionHandler: @escaping ([T]) -> Swift.Void) -> [S] {
        return appDelegateMixins.apply(work, completionHandler: completionHandler)
    }
}

extension Collection {
    @discardableResult
    internal func apply<T, S>(_ work: (Element, @escaping (T) -> Void) -> S?, completionHandler: @escaping ([T]) -> Swift.Void) -> [S] {
        let dispatchGroup = DispatchGroup()
        var results: [T] = []
        var returns: [S] = []

        for mixin in self {
            dispatchGroup.enter()
            let returned = work(mixin, { result in
                results.append(result)
                dispatchGroup.leave()
            })
            if let returned = returned {
                returns.append(returned)
            } else { // Method not implemented
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            completionHandler(results)
        }

        return returns
    }
}

import UserNotifications

extension MixinableAppDelegate: UNUserNotificationCenterDelegateMixinable {


    // The method will be called on the delegate only if the application is in the foreground. If the method is not implemented or the handler is not called in a timely manner then the notification will not be presented. The application can choose to have the notification presented as a sound, badge, alert and/or in the notification list. This decision should be based on whether the information in the notification is otherwise visible to the user.
    @available(iOS 10.0, *)
    open func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){

        userNotificationMixins.apply({ (mixin, completionHandler) -> Void? in
            mixin.userNotificationCenter?(center, willPresent: notification, withCompletionHandler: completionHandler)
        }, completionHandler: { [weak self] results in
            guard let self = self else { return }
            completionHandler(results.first ?? self.completionHandlerOptions(for: notification))
        })
    }


    // The method will be called on the delegate when the user responded to the notification by opening the application, dismissing the notification or choosing a UNNotificationAction. The delegate must be set before the application returns from application:didFinishLaunchingWithOptions:.
    @available(iOS 10.0, *)
    open func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void){

        userNotificationMixins.apply({ (mixin, completionHandler) -> Void? in
            mixin.userNotificationCenter?(center, didReceive: response, withCompletionHandler: completionHandler)
        }, completionHandler: { _ in
            completionHandler()
        })
    }


    // The method will be called on the delegate when the application is launched in response to the user's request to view in-app notification settings. Add UNAuthorizationOptionProvidesAppNotificationSettings as an option in requestAuthorizationWithOptions:completionHandler: to add a button to inline notification settings view and the notification settings view in Settings. The notification will be nil when opened from Settings.
    @available(iOS 12.0, *)
    open func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?){
        userNotificationMixins.forEach { $0.userNotificationCenter?(center, openSettingsFor: notification)}
    }
}
