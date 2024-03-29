//
//  Mixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 11/28/18.
//

import Foundation

public protocol LifeCycle{}
public protocol Mixinable: AnyObject{
    var mixins: [LifeCycle] { get }
    func createMixins() -> [LifeCycle]
}
