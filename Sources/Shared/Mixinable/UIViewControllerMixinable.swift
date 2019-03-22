//
//  UIViewControllerMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 11/27/18.
//

import UIKit

open class UIViewControllerMixin<Mixable>: SuperviewMixin<Mixable> & UIViewControllerLifeCycle{
    open func loadView() { }
    open func loadViewIfNeeded() { }
    open func viewDidLoad() { }
    open func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
    open func viewWillAppear(_ animated: Bool) { }
    open func viewDidAppear(_ animated: Bool) { }
    open func viewWillDisappear(_ animated: Bool) { }
    open func viewDidDisappear(_ animated: Bool) { }
    open func viewWillLayoutSubviews() { }
    open func viewDidLayoutSubviews() { }
    open func didReceiveMemoryWarning() { }
}

public protocol UIViewControllerLifeCycle: SuperviewLifeCycle{
    func loadView()
    func loadViewIfNeeded()
    func viewDidLoad()
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
    func viewWillLayoutSubviews()
    func viewDidLayoutSubviews()
    func didReceiveMemoryWarning()
}

//extension UIViewControllerLifeCycle{
//    public func loadView() { }
//    public func loadViewIfNeeded() { }
//    public func viewDidLoad() { }
//    public func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
//    public func viewWillAppear(_ animated: Bool) { }
//    public func viewDidAppear(_ animated: Bool) { }
//    public func viewWillDisappear(_ animated: Bool) { }
//    public func viewDidDisappear(_ animated: Bool) { }
//    public func viewWillLayoutSubviews() { }
//    public func viewDidLayoutSubviews() { }
//    public func didReceiveMemoryWarning() { }
//}
public protocol UIViewControllerMixinable: SuperviewMixinable{}

extension UIViewControllerMixinable{
    
    public var viewControllerMixins: [UIViewControllerLifeCycle]{
        return mixins.map{$0 as? UIViewControllerLifeCycle}.compactMap{$0}
    }
    
    public func mix_loadView(){
        viewControllerMixins.forEach{$0.loadView()}
    }
    public func mix_loadViewIfNeeded(){
        viewControllerMixins.forEach{$0.loadViewIfNeeded()}
    }
    public func mix_viewDidLoad(){
        viewControllerMixins.forEach{$0.viewDidLoad()}
    }
    public func mix_prepare(for segue: UIStoryboardSegue, sender: Any?){
        viewControllerMixins.forEach{$0.prepare(for: segue, sender: sender)}
    }
    public func mix_viewWillAppear(_ animated: Bool){
        viewControllerMixins.forEach{$0.viewWillAppear(animated)}
    }
    public func mix_viewDidAppear(_ animated: Bool){
        viewControllerMixins.forEach{$0.viewDidAppear(animated)}
    }
    public func mix_viewWillDisappear(_ animated: Bool){
        viewControllerMixins.forEach{$0.viewWillDisappear(animated)}
    }
    public func mix_viewDidDisappear(_ animated: Bool){
        viewControllerMixins.forEach{$0.viewDidDisappear(animated)}
    }
    public func mix_viewWillLayoutSubviews(){
        viewControllerMixins.forEach{$0.viewWillLayoutSubviews()}
    }
    public func mix_viewDidLayoutSubviews(){
        viewControllerMixins.forEach{$0.viewDidLayoutSubviews()}
    }
    public func mix_didReceiveMemoryWarning(){
        viewControllerMixins.forEach{$0.didReceiveMemoryWarning()}
    }
    
}

extension Array where Element: UIViewControllerLifeCycle{
    public func loadView(){
        forEach{$0.loadView()}
    }
    public func loadViewIfNeeded(){
        forEach{$0.loadViewIfNeeded()}
    }
    public func viewDidLoad(){
        forEach{$0.viewDidLoad()}
    }
    public func prepare(for segue: UIStoryboardSegue, sender: Any?){
        forEach{$0.prepare(for: segue, sender: sender)}
    }
    public func viewWillAppear(_ animated: Bool){
        forEach{$0.viewWillAppear(animated)}
    }
    public func viewDidAppear(_ animated: Bool){
        forEach{$0.viewDidAppear(animated)}
    }
    public func viewWillDisappear(_ animated: Bool){
        forEach{$0.viewWillDisappear(animated)}
    }
    public func viewDidDisappear(_ animated: Bool){
        forEach{$0.viewDidDisappear(animated)}
    }
    public func viewWillLayoutSubviews(){
        forEach{$0.viewWillLayoutSubviews()}
    }
    public func viewDidLayoutSubviews(){
        forEach{$0.viewDidLayoutSubviews()}
    }
    public func didReceiveMemoryWarning(){
        forEach{$0.didReceiveMemoryWarning()}
    }
}
