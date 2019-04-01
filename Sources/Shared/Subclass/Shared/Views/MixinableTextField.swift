//
//  MixinableTextField.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/3/18.
//
import UIKit


open class MixinableTextField: UITextField, UIViewMixinable{
    
    open lazy var mixins: [LifeCycle] = self.createMixins()
    
    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.textField(self)
    }
    
    //MARK: Initializers
    public convenience init(){
        self.init(callDidInit: true)
    }
    
    public init(callDidInit: Bool){
        super.init(frame: .zero)
        if callDidInit{
            initLifecycle(.programmatically)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initLifecycle(.programmatically)
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

    open func didInit(type: InitializationType) {
        mix_didInit(type: type)
        guard type == .programmatically else { return }
        mix_superviewLifecycle()
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
    
    //MARK: UIViewLifeCycle
    open override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        mix_willMove(toSuperview: newSuperview)
    }
    
    open override func didMoveToSuperview() {
        super.didMoveToSuperview()
        mix_didMoveToSuperview()
    }
    open override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        mix_willMove(toWindow: newWindow)
    }
    open override func didMoveToWindow() {
        super.didMoveToWindow()
        mix_didMoveToWindow()
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        mix_layoutSubviews()
    }
}
