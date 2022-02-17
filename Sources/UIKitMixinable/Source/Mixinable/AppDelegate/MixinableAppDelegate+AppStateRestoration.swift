//
//  MixinableAppDelegate+AppStateRestoration.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

#if !os(watchOS)
import UIKit

extension MixinableAppDelegate {

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return appDelegateMixins.compactMap { $0.application?(application, shouldSaveApplicationState: coder) }.contains(true)
    }

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return appDelegateMixins.compactMap { $0.application?(application, shouldRestoreApplicationState: coder) }.contains(true)
    }

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
        return appDelegateMixins.compactMap { $0.application?(application, viewControllerWithRestorationIdentifierPath: identifierComponents, coder: coder) }.first        
    }

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
        for mixin in appDelegateMixins {
            mixin.application?(application, willEncodeRestorableStateWith: coder)
        }
    }

    @available(iOS 6.0, *)
    open func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
        for mixin in appDelegateMixins {
            mixin.application?(application, didDecodeRestorableStateWith: coder)
        }
    }
}
#endif
