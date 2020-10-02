//
//  Mixin.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 11/27/18.
//

import Foundation

open class Mixin<Mixable>: NSObject where Mixable: NSObject {
    open weak var mixable: Mixable?
    
    public required init(_ mixable: Mixable){
        self.mixable = mixable
    }
}
