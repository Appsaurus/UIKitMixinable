//
//  MixinableAppDelegate.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 3/22/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

import UIKit

open class MixinableAppDelegate: UIResponder, UIApplicationDelegate {
    open var window: UIWindow?

    open lazy var mixins: [UIApplicationDelegateLifeCycle] = self.createMixins()

    open func createMixins() -> [UIApplicationDelegateLifeCycle] {
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
        let dispatchGroup = DispatchGroup()
        var results: [T] = []
        var returns: [S] = []

        for mixin in mixins {
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
