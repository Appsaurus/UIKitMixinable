//
//  MixinableTableViewHeaderFooterView.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 12/3/18.
//
import UIKit


open class MixinableTableViewHeaderFooterView: UITableViewHeaderFooterView, UIViewMixinable{
    
    open lazy var mixins: [LifeCycle] = self.createMixins()
    
    open func createMixins() -> [LifeCycle] {
        return DefaultMixins.tableViewHeaderFooterView(self)
    }
    
    //MARK: Initializers
    public convenience init(){
        self.init(callDidInit: true)
    }
    
    public init(callDidInit: Bool){
        super.init(reuseIdentifier: nil)
        if callDidInit{
            didInitProgramatically()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didInitFromCoder()
    }
    
    //MARK: TableViewHeaderFooterView Initializers
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
