//
//  MixinableAppDelegate+WatchKitInteracting.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

#if os(iOS)
import UIKit

extension MixinableAppDelegate {

    @available(iOS 8.2, *)
    open func application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable: Any]?, reply: @escaping ([AnyHashable: Any]?) -> Swift.Void) {
        apply({ (mixin, reply) -> Void? in
            mixin.application?(application, handleWatchKitExtensionRequest: userInfo, reply: reply)
        }, completionHandler: { results in
            let result = results.reduce([:], { initial, next in
                var initial = initial
                for (key, value) in next ?? [:] {
                    initial[key] = value
                }
                return initial
            })
            reply(result)
        })
    }
}
#endif
