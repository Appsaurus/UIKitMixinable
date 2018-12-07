//
//  SuperviewMixinable.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/27/18.
//

import Foundation

open class SuperviewMixin<Mixable>: InitializableMixin<Mixable> & SuperviewLifeCycle{
    open func createSubviews(){}
    open func didFinishCreatingAllViews(){}
    open func createAutoLayoutConstraints(){}
    open func setupControlActions(){}
    open func setupDelegates(){}
}

public protocol SuperviewLifeCycle: InitializableLifeCycle{
    func createSubviews()
    func didFinishCreatingAllViews()
    func createAutoLayoutConstraints()
    func setupControlActions()
    func setupDelegates()
}

public protocol SuperviewMixinable:
    NibLoadingMixinable,
    SuperviewLifeCycle
{}

extension SuperviewMixinable{
    public var superViewMixins: [SuperviewLifeCycle]{
        return mixins.map{$0 as? SuperviewLifeCycle}.compactMap{$0}
    }
    
    public func mix_createSubviews(){
        superViewMixins.forEach{$0.createSubviews()}
    }
    public func mix_createAutoLayoutConstraints(){
        superViewMixins.forEach{$0.createAutoLayoutConstraints()}
    }
    public func mix_didFinishCreatingAllViews(){
        superViewMixins.forEach{$0.didFinishCreatingAllViews()}
    }
    public func mix_setupControlActions(){
        superViewMixins.forEach{$0.setupControlActions()}
    }
    
    public func mix_setupDelegates(){
        superViewMixins.forEach{$0.setupDelegates()}
    }
    
    //MARK: Extended LifeCycle for UIView and UIViewController
    public func mix_superviewLifecycle(){
        createSubviews()
        didFinishCreatingAllViews()
        createAutoLayoutConstraints()
        setupControlActions()
        setupDelegates()
    }
}
