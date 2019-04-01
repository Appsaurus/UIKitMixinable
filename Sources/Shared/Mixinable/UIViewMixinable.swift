//
//  UIViewMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 11/27/18.
//

import UIKit

open class UIViewMixin<Mixable>: SuperviewMixin<Mixable> & UIViewLifeCycle{
    open func willMove(toSuperview newSuperview: UIView?){}
    open func didMoveToSuperview(){}
    open func willMove(toWindow newWindow: UIWindow?){}
    open func didMoveToWindow(){}
    open func layoutSubviews(){}
    open func point(inside point: CGPoint, with event: UIEvent?) -> Bool?{ return nil }

}

 public protocol UIViewLifeCycle: SuperviewLifeCycle{
    func willMove(toSuperview newSuperview: UIView?)
    func didMoveToSuperview()
    func willMove(toWindow newWindow: UIWindow?)
    func didMoveToWindow()
    func layoutSubviews()
    func point(inside point: CGPoint, with event: UIEvent?) -> Bool?
}

public protocol UIViewMixinable: SuperviewMixinable{}

extension UIViewMixinable{
    
    public var viewMixins: [UIViewLifeCycle]{
        return mixins.map{$0 as? UIViewLifeCycle}.compactMap{$0}
    }
    
    public func mix_willMove(toSuperview newSuperview: UIView?){
        viewMixins.forEach{$0.willMove(toSuperview: newSuperview)}
    }
    public func mix_didMoveToSuperview(){
        viewMixins.forEach{$0.didMoveToSuperview()}
    }
    public func mix_willMove(toWindow newWindow: UIWindow?){
        viewMixins.forEach{$0.willMove(toWindow: newWindow)}
    }
    public func mix_didMoveToWindow(){
        viewMixins.forEach{$0.didMoveToWindow()}
    }
    public func mix_layoutSubviews(){
        viewMixins.forEach{$0.layoutSubviews()}
    }
}
