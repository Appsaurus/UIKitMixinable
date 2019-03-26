//
//  MixinableAppDelegate+URLOpening.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

import UIKit

extension MixinableAppDelegate {

    @available(iOS 9.0, *)
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return appDelegateMixins.compactMap { $0.application?(app, open: url, options: options) }.contains(true)
    }
}
