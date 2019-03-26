//
//  UINibLoadingMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

import Foundation

open class NibLoadingMixin<Mixable>: InitializableMixin<Mixable>{
//    open func awakeFromNib(){}
//    open func prepareForInterfaceBuilder(){}
}

public protocol NibLoadingLifeCycle: InitializableLifeCycle{
    func awakeFromNib()
    func prepareForInterfaceBuilder()
}

public protocol NibLoadingMixinable: InitializableMixinable{}

extension NibLoadingMixinable{
    public var nibLoadingMixins: [NibLoadingLifeCycle]{
        return mixins.map{$0 as? NibLoadingLifeCycle}.compactMap{$0}
    }
    
    public func mix_awakeFromNib(){
        nibLoadingMixins.forEach{$0.awakeFromNib()}
    }
    public func mix_prepareForInterfaceBuilder(){
        nibLoadingMixins.forEach{$0.prepareForInterfaceBuilder()}
    }
}
