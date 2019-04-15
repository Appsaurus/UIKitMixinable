//
//  MixinablePageViewController.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKit


open class MixinablePageViewController: UIPageViewController, UIViewControllerMixinable{
    
    open lazy var mixins: [LifeCycle] = self.createMixins()
    
    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.pageViewController(self)
    }
    
    //MARK: Initializers
    public convenience init(){
        self.init(callDidInit: true)
    }
    
    public init(callDidInit: Bool){
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        if callDidInit{
        initLifecycle(.programmatically)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLifecycle(.coder)
    }
    
    //MARK: UIPageViewController Initializers
    public override init(transitionStyle style: UIPageViewController.TransitionStyle,
                         navigationOrientation: UIPageViewController.NavigationOrientation,
                         options: [UIPageViewController.OptionsKey : Any]? = nil) {
//        let options = convertFromOptionalUIPageViewControllerOptionsKeyDictionary(options)
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        initLifecycle(.programmatically)
    }
    
    //MARK: InitializableLifeCycle
    open func initProperties() {
        mix_initProperties()
    }
    open func initDerivedProperties() {
        mix_initDerivedProperties()
    }
    open func didInit(type: InitializationType) {
        mix_didInit(type: type)
    }
    
    deinit {
        mix_willDeinit()
    }
    
    //MARK: SuperviewLifeCycle
    open func createSubviews() {
        mix_createSubviews()
    }
    open func createAutoLayoutConstraints() {
        mix_createAutoLayoutConstraints()
    }
    open func didFinishCreatingAllViews() {
        mix_didFinishCreatingAllViews()
    }
    open func setupControlActions() {
        mix_setupControlActions()
    }
    open func setupDelegates() {
        mix_setupDelegates()
    }
    
    
    //MARK: UIViewControllerLifeCycle
    open override func loadView() {
        super.loadView()
        mix_loadView()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        mix_viewDidLoadLifecycle()
    }
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        mix_prepare(for: segue, sender: sender)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mix_viewWillAppear(animated)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mix_viewDidAppear(animated)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mix_viewWillDisappear(animated)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mix_viewDidDisappear(animated)
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mix_viewWillLayoutSubviews()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mix_viewDidLayoutSubviews()
    }
    
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        mix_didReceiveMemoryWarning()
    }
}

//// Helper function inserted by Swift 4.2 migrator.
//fileprivate func convertFromOptionalUIPageViewControllerOptionsKeyDictionary(_ input: [UIPageViewController.OptionsKey: Any]?) -> [String: Any]? {
//    guard let input = input else { return nil }
//    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
//}
//
//// Helper function inserted by Swift 4.2 migrator.
//fileprivate func convertToOptionalUIPageViewControllerOptionsKeyDictionary(_ input: [String: Any]?) -> [UIPageViewController.OptionsKey: Any]? {
//    guard let input = input else { return nil }
//    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIPageViewController.OptionsKey(rawValue: key), value)})
//}
