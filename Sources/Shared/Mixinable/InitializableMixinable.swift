//
//  InitializableMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 11/27/18.
//

import Foundation



open class InitializableMixin<Mixable>: Mixin<Mixable> & InitializableLifeCycle{
    open func didInitProgramatically() { }
    open func didInitFromCoder() { }
    open func didInitFromNib() { }
    open func didInit() { }
    open func initProperties() {}
    open func initDerivedProperties() {}
    open func willDeinit() { }
}

public protocol InitializableLifeCycle: LifeCycle{
    func didInitFromCoder()
    func didInitFromNib()
    func didInitProgramatically()
    func didInit()
    func initProperties()
    func initDerivedProperties()
    func willDeinit()
}

public enum InitializationType {
    case coder
    case nib
    case programmatically
}

extension InitializableLifeCycle{
    public func willDeinit() { }
    public func initLifecycle(_ initializationType: InitializationType = .programmatically){
        initAllProperties()
        switch initializationType {
        case .nib:
            didInitFromNib()
        case .coder:
            didInitFromCoder()
        case .programmatically:
            didInitProgramatically()
        }
        didInit()
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
    
    public func mix_didInitFromCoder() {
        initMixins.forEach{$0.didInitFromCoder()}
    }
    
    public func mix_didInitFromNib() {
        initMixins.forEach{$0.didInitFromNib()}
    }
    
    public func mix_didInitProgramatically() {
        initMixins.forEach{$0.didInitProgramatically()}
    }
    
    public func mix_didInit() {
        initMixins.forEach{$0.didInit()}
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
