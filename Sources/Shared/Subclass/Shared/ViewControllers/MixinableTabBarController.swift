//
//  MixinableTabBarController.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKit

internal enum InitializationType {
    case coder
    case nib
    case other
}

// NOTE: UITabBarController initialization lifecycle is unique in that it calls viewDidLoad() when you call super.init(),
// therefore didInit methods need to be handled in loadView() in order for them to behave as expected.

open class MixinableTabBarController: UITabBarController, UIViewControllerMixinable{

    open lazy var mixins: [LifeCycle] = self.createMixins()

    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.tabBarController(self)
    }

    internal var initializationType: InitializationType = .other
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
        switch initializationType {
        case .nib:
            didInitFromNib()
        case .coder:
            didInitFromCoder()
        default: break
        }
        didInit()
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
