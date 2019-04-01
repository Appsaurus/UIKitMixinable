//
//  MixinableBarButtonItem.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 11/27/18.
//

import UIKit


open class MixinableBarButtonItem: UIBarButtonItem, UIViewMixinable{
    
    open lazy var mixins: [LifeCycle] = self.createMixins()
    
    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.barButtonItem(self)
    }
    
    //MARK: Initializers
    public override convenience init(){
        self.init(callDidInit: true)
    }
    
    public init(callDidInit: Bool){
        super.init()
        if callDidInit{
            initLifecycle(.programmatically)
            mix_superviewLifecycle()
        }
    }
    
    public convenience init(customView: UIView){
        self.init(callDidInit: false)
        self.customView = customView
        initLifecycle(.programmatically)
        mix_superviewLifecycle()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLifecycle(.coder)
    }
    
    //MARK: InitializableLifeCycle
    open func initProperties() {
        mix_initProperties()
    }
    open func initDerivedProperties() {
        mix_initDerivedProperties()
    }
    open func didInit() {
        mix_didInit()
    }
    
    open func didInitProgramatically() {
        mix_didInitProgramatically()
    }
    
    open func didInitFromNib() {
        mix_didInitFromNib()
    }
    
    public func didInitFromCoder() {
        mix_didInitFromCoder()
    }
    
    //MARK: NibLoadingMixinable
    open override func awakeFromNib() {
        super.awakeFromNib()
        mix_awakeFromNib()
        mix_superviewLifecycle()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        mix_prepareForInterfaceBuilder()
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
}
