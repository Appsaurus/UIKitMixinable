//
//  MixinableAppDelegate.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

import UIKit
import CloudKit
import Intents

public protocol UIApplicationDelegateLifeCycle: UIApplicationDelegate, LifeCycle{
    func didInit()
    func initProperties()
    func initDerivedProperties()
}

extension UIApplicationDelegateLifeCycle {
    public var window: UIWindow? {
        return UIApplication.shared.delegate?.window ?? nil
    }
}

open class UIApplicationDelegateMixin<Mixable>: Mixin<Mixable> & UIApplicationDelegateLifeCycle{
    open func didInit() {}
    open func initProperties() {}
    open func initDerivedProperties() {}
    open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool { return true }
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool { return true }
    open func applicationDidFinishLaunching(_ application: UIApplication) {}
    open func applicationDidBecomeActive(_ application: UIApplication) {}
    open func applicationWillResignActive(_ application: UIApplication) {}
    open func applicationDidEnterBackground(_ application: UIApplication) {}
    open func applicationWillEnterForeground(_ application: UIApplication) {}
    open func applicationWillTerminate(_ application: UIApplication) {}
    open func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {}
    open func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {}
    open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {}
    open func applicationSignificantTimeChange(_ application: UIApplication) {}
    open func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool { return true }
    open func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool { return true }
    open func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? { return nil }
    open func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {}
    open func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {}
    @available(iOS 10.0, *)
    open func application(_ application: UIApplication, userDidAcceptCloudKitShareWith cloudKitShareMetadata: CKShare.Metadata) {}
    open func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool { return true }
    open func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Swift.Void) -> Bool { return true }
    open func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {}
    open func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {}
    open func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {}
    open func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Swift.Void) {}
    open func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool { return true }
    open func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Swift.Void) {}
    open func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {}
    open func application(_ application: UIApplication, willChangeStatusBarOrientation newStatusBarOrientation: UIInterfaceOrientation, duration: TimeInterval) {}
    open func application(_ application: UIApplication, didChangeStatusBarOrientation oldStatusBarOrientation: UIInterfaceOrientation) {}
    open func application(_ application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect) {}
    open func application(_ application: UIApplication, didChangeStatusBarFrame oldStatusBarFrame: CGRect) {}
    open func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {}
    open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {}
    open func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {}
    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {}
    open func application(_ application: UIApplication, didReceive notification: UILocalNotification) {}
    open func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Swift.Void) {}
    open func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable: Any], withResponseInfo responseInfo: [AnyHashable: Any], completionHandler: @escaping () -> Swift.Void) {}
    open func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable: Any], completionHandler: @escaping () -> Swift.Void) {}
    open func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, withResponseInfo responseInfo: [AnyHashable: Any], completionHandler: @escaping () -> Swift.Void) {}
    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {}
    @available(iOS 10.0, *)
    open func application(_ application: UIApplication, handle intent: INIntent, completionHandler: @escaping (INIntentResponse) -> Swift.Void) {}
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool { return true }
    open func application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable: Any]?, reply: @escaping ([AnyHashable: Any]?) -> Swift.Void) {}

}

public protocol UIApplicationDelegateMixinable: Mixinable {}
