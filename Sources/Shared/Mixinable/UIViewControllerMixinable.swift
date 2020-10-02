//
//  UIViewControllerMixinable.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 11/27/18.
//

import UIKit

open class UIViewControllerMixin<Mixable>: SuperviewMixin<Mixable> & UIViewControllerLifeCycle where Mixable: NSObject{
    open func loadView() { }
    open func loadViewIfNeeded() { }
    open func viewDidLoad() { }
    open func loadAsyncData() { }
    open func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
    open func viewWillAppear(_ animated: Bool) { }
    open func viewDidAppear(_ animated: Bool) { }
    open func viewWillDisappear(_ animated: Bool) { }
    open func viewDidDisappear(_ animated: Bool) { }
    open func viewWillLayoutSubviews() { }
    open func viewDidLayoutSubviews() { }
    open func didReceiveMemoryWarning() { }
    open func willMove(toParent parent: UIViewController?) {}
    open func didMove(toParent parent: UIViewController?) {}
}

public protocol UIViewControllerLifeCycle: SuperviewLifeCycle{
    func loadView()
    func loadViewIfNeeded()
    func viewDidLoad()
    func loadAsyncData()
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
    func viewWillLayoutSubviews()
    func viewDidLayoutSubviews()
    func didReceiveMemoryWarning()
    func willMove(toParent parent: UIViewController?)
    func didMove(toParent parent: UIViewController?)
}

public protocol UIViewControllerMixinable: SuperviewMixinable{
    func loadAsyncData()
}

extension UIViewControllerMixinable {
    public func mix_viewDidLoadLifecycle(){
        mix_superviewLifecycle()
        mix_viewDidLoad()
        loadAsyncData()
    }
}
extension UIViewControllerMixinable {
    
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
    public func mix_loadAsyncData(){
        viewControllerMixins.forEach{$0.loadAsyncData()}
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

    public func mix_willMove(toParent parent: UIViewController?) {
        viewControllerMixins.forEach{$0.willMove(toParent: parent)}
    }
    public func mix_didMove(toParent parent: UIViewController?) {
        viewControllerMixins.forEach{$0.didMove(toParent: parent)}
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

    public func willMove(toParent parent: UIViewController?) {
        forEach{$0.willMove(toParent: parent)}
    }
    public func didMove(toParent parent: UIViewController?) {
        forEach{$0.didMove(toParent: parent)}
    }
}

//public protocol UIViewControllerMixinable: SuperviewMixinable{
//    func loadAsyncData()
//}
//
//extension UIViewControllerMixinable {
//    public func mix_viewDidLoadLifecycle(){
//        mix_superviewLifecycle()
//        mix_viewDidLoad()
//        loadAsyncData()
//    }
//}
//extension UIViewControllerMixinable {
//
//    public var viewControllerMixins: [UIViewControllerLifeCycle]{
//        return mixins.map{$0 as? UIViewControllerLifeCycle}.compactMap{$0}
//    }
//    public func mix_loadView(){
//        viewControllerMixins.forEach{$0.loadView()}
//    }
//    public func mix_loadViewIfNeeded(){
//        viewControllerMixins.forEach{$0.loadViewIfNeeded()}
//    }
//    public func mix_viewDidLoad(){
//        viewControllerMixins.forEach{$0.viewDidLoad()}
//    }
//    public func mix_loadAsyncData(){
//        viewControllerMixins.forEach{$0.loadAsyncData()}
//    }
//    public func mix_prepare(for segue: UIStoryboardSegue, sender: Any?){
//        viewControllerMixins.forEach{$0.prepare(for: segue, sender: sender)}
//    }
//    public func mix_viewWillAppear(_ animated: Bool){
//        viewControllerMixins.forEach{$0.viewWillAppear(animated)}
//    }
//    public func mix_viewDidAppear(_ animated: Bool){
//        viewControllerMixins.forEach{$0.viewDidAppear(animated)}
//    }
//    public func mix_viewWillDisappear(_ animated: Bool){
//        viewControllerMixins.forEach{$0.viewWillDisappear(animated)}
//    }
//    public func mix_viewDidDisappear(_ animated: Bool){
//        viewControllerMixins.forEach{$0.viewDidDisappear(animated)}
//    }
//    public func mix_viewWillLayoutSubviews(){
//        viewControllerMixins.forEach{$0.viewWillLayoutSubviews()}
//    }
//    public func mix_viewDidLayoutSubviews(){
//        viewControllerMixins.forEach{$0.viewDidLayoutSubviews()}
//    }
//    public func mix_didReceiveMemoryWarning(){
//        viewControllerMixins.forEach{$0.didReceiveMemoryWarning()}
//    }
//
//}
//
//extension Array where Element: UIViewControllerLifeCycle{
//    public func loadView(){
//        forEach{$0.loadView()}
//    }
//    public func loadViewIfNeeded(){
//        forEach{$0.loadViewIfNeeded()}
//    }
//    public func viewDidLoad(){
//        forEach{$0.viewDidLoad()}
//    }
//    public func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        forEach{$0.prepare(for: segue, sender: sender)}
//    }
//    public func viewWillAppear(_ animated: Bool){
//        forEach{$0.viewWillAppear(animated)}
//    }
//    public func viewDidAppear(_ animated: Bool){
//        forEach{$0.viewDidAppear(animated)}
//    }
//    public func viewWillDisappear(_ animated: Bool){
//        forEach{$0.viewWillDisappear(animated)}
//    }
//    public func viewDidDisappear(_ animated: Bool){
//        forEach{$0.viewDidDisappear(animated)}
//    }
//    public func viewWillLayoutSubviews(){
//        forEach{$0.viewWillLayoutSubviews()}
//    }
//    public func viewDidLayoutSubviews(){
//        forEach{$0.viewDidLayoutSubviews()}
//    }
//    public func didReceiveMemoryWarning(){
//        forEach{$0.didReceiveMemoryWarning()}
//    }
//}


