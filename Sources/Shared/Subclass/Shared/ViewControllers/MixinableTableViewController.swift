//
//  MixinableTableViewController.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKit


open class MixinableTableViewController: UITableViewController, UIViewControllerMixinable{
    
    open lazy var mixins: [LifeCycle] = self.createMixins()
    
    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.tableViewController(self)
    }
    
    //MARK: Initializers
    public init(){
        super.init(style: .grouped)
        initLifecycle(.programmatically)
    }
    
    public init(callDidInit: Bool){
        super.init(style: .grouped)
        if callDidInit{
        initLifecycle(.programmatically)
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLifecycle(.coder)
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initLifecycle(.nib)
    }

    //MARK: TableView Initializers
    public override init(style: UITableView.Style) {
        super.init(style: style)
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
