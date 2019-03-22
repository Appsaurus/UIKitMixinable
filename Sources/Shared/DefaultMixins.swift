//
//  BaseViewControllerMixins.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKit

open class DefaultViewMixin: UIViewMixin<UIView>{}

open class DefaultViewControllerMixin: UIViewControllerMixin<UIViewController>{
    open override func didInit() {
        mixable.automaticallyAdjustsScrollViewInsets = false
        mixable.edgesForExtendedLayout = .all
        if #available(iOS 11.0, *) {
            mixable.additionalSafeAreaInsets = .zero
        }
    }
}

public typealias DefaultMixinsClosure<O: NSObject> = (_ object: O) -> [LifeCycle]
open class DefaultMixins{
    
    //MARK: ViewControllers
    static public var viewControllers: DefaultMixinsClosure<UIViewController> = { vc in
        return [
            DefaultViewControllerMixin(vc)
        ]
    }
    
    static public var viewController: DefaultMixinsClosure<UIViewController> = { vc in
        return viewControllers(vc)
    }
    
    static public var tableViewController: DefaultMixinsClosure<UITableViewController> = { vc in
        return viewControllers(vc)
    }
    
    static public var collectionViewController: DefaultMixinsClosure<UICollectionViewController> = { vc in
        return viewControllers(vc)
    }
    
    static public var tabBarController: DefaultMixinsClosure<UITabBarController> = { vc in
        return viewControllers(vc)
    }
    
    static public var navigationController: DefaultMixinsClosure<UINavigationController> = { vc in
        return viewControllers(vc)
    }
    
    static public var pageViewController: DefaultMixinsClosure<UIPageViewController> = { vc in
        return viewControllers(vc)
    }
    
    //MARK: Views
    
    static public var views: DefaultMixinsClosure<UIView> = { view in
        return [
            DefaultViewMixin(view)
        ]
    }
    
    static public var view: DefaultMixinsClosure<UIView> = { view in
        return views(view)
    }
    
    static public var button: DefaultMixinsClosure<UIButton> = { view in
        return views(view)
    }
    
    static public var collectionViewCell: DefaultMixinsClosure<UICollectionViewCell> = { view in
        return views(view)
    }
    
    static public var imageView: DefaultMixinsClosure<UIImageView> = { view in
        return views(view)
    }
    
    static public var scrollView: DefaultMixinsClosure<UIScrollView> = { view in
        return views(view)
    }
    
    static public var searchBar: DefaultMixinsClosure<UISearchBar> = { view in
        return views(view)
    }
    
    static public var tableViewCell: DefaultMixinsClosure<UITableViewCell> = { view in
        return views(view)
    }
    
    static public var tableViewHeaderFooterView: DefaultMixinsClosure<UITableViewHeaderFooterView> = { view in
        return views(view)
    }
    
    static public var textField: DefaultMixinsClosure<UITextField> = { view in
        return views(view)
    }
    
    static public var toolbar: DefaultMixinsClosure<UIToolbar> = { view in
        return views(view)
    }
    
    //MARK: Other
    static public var barButtonItem: DefaultMixinsClosure<UIBarButtonItem> = { view in
        return []
    }
}
