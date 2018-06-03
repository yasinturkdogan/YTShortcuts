//
//  Run.swift
//  YTShortcuts
//
//  Created by Yasin Turkdogan on 04/06/2018.
//  Copyright © 2018 Yasin Turkdogan. All rights reserved.
//

import Foundation

public class Run {
    
    /// Run given block after x seconds. Main thread is used to run the block.
    /// - Returns: A Closure to cancel request
    @discardableResult public static func after(_ delay: Double, block: @escaping SimpleClosure) -> SimpleClosure {
        var cancelled = false
        let cancelClosure: SimpleClosure = {
            cancelled = true
        }
        
        let time = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            () -> Void in
            if cancelled == false {
                block()
            }
        }
        return cancelClosure
    }
    
    /// Runs given block in Main Thread
    open class func onMainThread(_ block: @escaping SimpleClosure) {
        DispatchQueue.main.async {
            block()
        }
    }
}
