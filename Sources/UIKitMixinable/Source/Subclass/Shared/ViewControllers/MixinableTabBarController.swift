//
//  MixinableTabBarController.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/3/18.
//

#if !os(watchOS)
import UIKit

// NOTE: UITabBarController initialization lifecycle is unique in that it calls viewDidLoad() when you call super.init(),
// therefore didInit methods need to be handled in loadView() in order for them to behave as expected.

open class MixinableTabBarController: UITabBarController, UIViewControllerMixinable{

    open lazy var mixins: [LifeCycle] = self.createMixins()

    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.tabBarController(self)
    }

    internal var initializationType: InitializationType = .programmatically
    //MARK: Initializers

    public required init?(coder aDecoder: NSCoder) {
        initializationType = .coder
        super.init(coder: aDecoder)
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        initializationType = .nib
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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
        initLifecycle(initializationType)
        super.loadView()
        mix_loadView()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        mix_viewDidLoadLifecycle()
    }

    open func loadAsyncData() {
        mix_loadAsyncData()
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
#endif
