//
//  Mixin.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 11/27/18.
//

import Foundation

open class Mixin<Mixable>: NSObject {
    open var mixable: Mixable? {
        return _weakMixable as? Mixable ?? _mixable
    }

    open weak var _weakMixable: NSObject?
    open var _mixable: Mixable?

    public required init(_ mixable: Mixable){
        if let weakMixable = mixable as? NSObject {
            _weakMixable = weakMixable
        }
        else {
            _mixable = mixable
        }
    }
}
