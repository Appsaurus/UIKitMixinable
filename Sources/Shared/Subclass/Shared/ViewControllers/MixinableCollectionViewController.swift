//
//  MixinableCollectionViewController.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/3/18.
//
import UIKit


open class MixinableCollectionViewController: UICollectionViewController, UIViewControllerMixinable{
    
    open lazy var mixins: [LifeCycle] = self.createMixins()
    
    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.collectionViewController(self)
    }
    
    //MARK: Initializers
    public init(){
        super.init(nibName: nil, bundle: nil)
        didInitProgramatically()
        didInit()
    }
    
    public init(callDidInit: Bool){
        super.init(nibName: nil, bundle: nil)
        if callDidInit{
            didInitProgramatically()
            didInit()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didInitFromCoder()
        didInit()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        didInitFromNib()
        didInit()
    }
    
    //MARK: CollectionViewController Initializers
    public override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        didInitProgramatically()
        didInit()
    }
    
    //MARK: InitializableLifeCycle
    open func didInit() {
        mix_didInit()
    }
    
    open func didInitProgramatically() {
        mix_didInitProgramatically()
    }
    
    open func didInitFromCoder() {
        mix_didInitFromCoder()
    }
    
    open func didInitFromNib() {
        mix_didInitFromNib()
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
        mix_superviewLifecycle()
        mix_viewDidLoad()
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



