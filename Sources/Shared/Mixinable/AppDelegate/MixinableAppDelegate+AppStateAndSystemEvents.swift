//
//  MixinableAppDelegate+AppStateAndSystemEvents.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

import UIKit

extension MixinableAppDelegate {

    @available(iOS 2.0, *)
    open func applicationDidBecomeActive(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationDidBecomeActive?(application)
        }
    }

    @available(iOS 2.0, *)
    open func applicationWillResignActive(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationWillResignActive?(application)
        }
    }

    @available(iOS 4.0, *)
    open func applicationDidEnterBackground(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationDidEnterBackground?(application)
        }
    }

    @available(iOS 4.0, *)
    open func applicationWillEnterForeground(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationWillEnterForeground?(application)
        }
    }

    @available(iOS 2.0, *)
    open func applicationWillTerminate(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationWillTerminate?(application)
        }
    }

    @available(iOS 4.0, *)
    open func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationProtectedDataWillBecomeUnavailable?(application)
        }
    }

    @available(iOS 4.0, *)
    open func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationProtectedDataDidBecomeAvailable?(application)
        }
    }

    @available(iOS 2.0, *)
    open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationDidReceiveMemoryWarning?(application)
        }
    }

    @available(iOS 2.0, *)
    open func applicationSignificantTimeChange(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationSignificantTimeChange?(application)
        }
    }
}
