//
//  MixinableImageView.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKit


open class MixinableImageView: UIImageView, UIViewMixinable{
    
    open lazy var mixins: [LifeCycle] = self.createMixins()
    
    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.imageView(self)
    }
    
    //MARK: Initializers
    public convenience init(){
        self.init(callDidInit: true)
    }
    
    public init(callDidInit: Bool){
        super.init(frame: .zero)
        if callDidInit{
            didInitProgramatically()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        didInitProgramatically()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didInitFromCoder()
    }
    
    //MARK: UIImageView Initializers
    public override init(image: UIImage?) {
        super.init(image: image)
        didInitProgramatically()
    }
    
    public override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        didInitProgramatically()
    }
    
    //MARK: InitializableLifeCycle
    open func didInit() {
        mix_didInit()
    }
    
    open func didInitProgramatically() {
        mix_didInitProgramatically()
        didInit()
        mix_superviewLifecycle()
    }
    
    open func didInitFromNib() {
        mix_didInitFromNib()
        didInit()
    }
    
    public func didInitFromCoder() {
        mix_didInitFromCoder()
        didInit()
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
