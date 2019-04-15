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
    
    open func createMixins() -> [LifeCycle] {
        return []
    }
    
    override public init() {
        super.init()
        initProperties()
        initDerivedProperties()
        didInit()
    }
    
    open func initProperties(){
        appDelegateMixins.forEach { $0.initProperties() }
    }
    open func initDerivedProperties(){
        appDelegateMixins.forEach { $0.initDerivedProperties() }
    }
    open func didInit() {
        appDelegateMixins.forEach { $0.didInit() }
    }
    
    @discardableResult
    public func apply<T, S>(_ work: (UIApplicationDelegateLifeCycle, @escaping (T) -> Void) -> S?, completionHandler: @escaping ([T]) -> Swift.Void) -> [S] {
        return appDelegateMixins.apply(work, completionHandler: completionHandler)
    }
    @discardableResult
    public func apply<S>(_ work: (UIApplicationDelegateLifeCycle, @escaping () -> Void) -> S?, completionHandler: @escaping () -> Swift.Void) -> [S] {
        return appDelegateMixins.apply(work, completionHandler: completionHandler)
    }
}

extension Collection {
    @discardableResult
    public func apply<S>(_ work: (Element, @escaping () -> Void) -> S?, completionHandler: @escaping () -> Swift.Void) -> [S] {
        let dispatchGroup = DispatchGroup()
        var returns: [S] = []

        for mixin in self {
            dispatchGroup.enter()
            let returned = work(mixin, {
                dispatchGroup.leave()
            })
            if let returned = returned {
                returns.append(returned)
            } else { // Method not implemented
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            completionHandler()
        }

        return returns
    }
    @discardableResult
    public func apply<T, S>(_ work: (Element, @escaping (T) -> Void) -> S?, completionHandler: @escaping ([T]) -> Swift.Void) -> [S] {
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
