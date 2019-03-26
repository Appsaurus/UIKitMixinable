//
//  MixinableAppDelegate+ExtensionTypes.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

import UIKit

extension MixinableAppDelegate {

    // Applications may reject specific types of extensions based on the extension point identifier.
    // Constants representing common extension point identifiers are provided further down.
    // If unimplemented, the default behavior is to allow the extension point identifier.
    @available(iOS 8.0, *)
    open func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        return appDelegateMixins.compactMap { $0.application?(application, shouldAllowExtensionPointIdentifier: extensionPointIdentifier) }.contains(true)
    }
}
