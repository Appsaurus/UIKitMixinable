//
//  MixinableAppDelegate.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

import UIKit

public protocol UIApplicationDelegateLifeCycle: UIApplicationDelegate, LifeCycle{
    func didInit()
}

extension UIApplicationDelegateLifeCycle {
    public var window: UIWindow? {
        return UIApplication.shared.delegate?.window ?? nil
    }
}

open class UIApplicationDelegateMixin<Mixable>: Mixin<Mixable> & UIApplicationDelegateLifeCycle{
    open func didInit() {}
}
