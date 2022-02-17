//
//  MixinableAppDelegate+HealthKitInteracting.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

#if !os(watchOS)
import UIKit

extension MixinableAppDelegate {

    @available(iOS 9.0, *)
    open func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        for mixin in appDelegateMixins {
            mixin.applicationShouldRequestHealthAuthorization?(application)
        }
    }
}
#endif
