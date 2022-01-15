//
//  MixinableAppDelegate+SiriKitHandling.swift
//  UIKitMixinable
//
//  Created by Brian Strobach on 12/4/18.
//

#if !os(watchOS)
import UIKit
import Intents

extension MixinableAppDelegate {

    @available(iOS 11.0, *)
    open func application(_ application: UIApplication, handle intent: INIntent, completionHandler: @escaping (INIntentResponse) -> Swift.Void) {
        apply({ (mixin, completionHandler) -> Void? in
            mixin.application?(application, handle: intent, completionHandler: completionHandler)
        }, completionHandler: { results in
            let result = results.min(by: { $0.hashValue < $1.hashValue }) ?? INIntentResponse()
            completionHandler(result)
        })
    }
}
#endif
