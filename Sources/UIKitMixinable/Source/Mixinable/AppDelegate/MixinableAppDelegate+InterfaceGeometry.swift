//
//  MixinableAppDelegate+InterfaceGeometry.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

#if os(iOS)
import UIKit

extension MixinableAppDelegate {

    @available(iOS 2.0, *)
    open func application(_ application: UIApplication, willChangeStatusBarOrientation newStatusBarOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        for mixin in appDelegateMixins {
            mixin.application?(application, willChangeStatusBarOrientation: newStatusBarOrientation, duration: duration)
        }
    }

    @available(iOS 2.0, *)
    open func application(_ application: UIApplication, didChangeStatusBarOrientation oldStatusBarOrientation: UIInterfaceOrientation) {
        for mixin in appDelegateMixins {
            mixin.application?(application, didChangeStatusBarOrientation: oldStatusBarOrientation)
        }
    }

    @available(iOS 2.0, *)
    open func application(_ application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect) {
        for mixin in appDelegateMixins {
            mixin.application?(application, willChangeStatusBarFrame: newStatusBarFrame)
        }
    }

    @available(iOS 2.0, *)
    open func application(_ application: UIApplication, didChangeStatusBarFrame oldStatusBarFrame: CGRect) {
        for mixin in appDelegateMixins {
            mixin.application?(application, didChangeStatusBarFrame: oldStatusBarFrame)
        }
    }
}

#endif
