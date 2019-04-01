//
//  InitializableMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 11/27/18.
//

import Foundation



open class InitializableMixin<Mixable>: Mixin<Mixable> & InitializableLifeCycle{
    open func didInit(type: InitializationType) {}
    open func initProperties() {}
    open func initDerivedProperties() {}
    open func willDeinit() { }
}

public protocol InitializableLifeCycle: LifeCycle{
    func didInit(type: InitializationType)
    func initProperties()
    func initDerivedProperties()
    func willDeinit()
}

public enum InitializationType {
    case coder
    case nib
    case programmatically
}

//public protocol InitializationTypeAware {
//    var initializationType: InitializationType { get set }
//}

extension InitializableLifeCycle{
    public func willDeinit() { }
}
extension InitializableLifeCycle {
    public func initLifecycle(_ initializationType: InitializationType = .programmatically){
        initAllProperties()
        didInit(type: initializationType)
    }
    public func initAllProperties(){
        initProperties()
        initDerivedProperties()
    }
}

public protocol InitializableMixinable: Mixinable{}

extension InitializableMixinable{
    
    public var initMixins: [InitializableLifeCycle]{
        return mixins.map{$0 as? InitializableLifeCycle}.compactMap{$0}
    }
    
    public func mix_didInit(type: InitializationType) {
        initMixins.forEach{$0.didInit(type: type)}
    }

    public func mix_initProperties() {
        initMixins.forEach{$0.initProperties()}
    }
    public func mix_initDerivedProperties() {
        initMixins.forEach{$0.initDerivedProperties()}
    }
    
    public func mix_willDeinit() {
        initMixins.forEach{$0.willDeinit()}
    }
}
