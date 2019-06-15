//
//  Helper.swift
//  BigBurger
//
//  Created by admin on 6/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import Foundation
open class Helper: NSObject
{
    fileprivate static let instance = Helper()
    
    
    public static func getInstance() -> Helper {
        return .instance
    }
    
    @objc func log(logMessage: String, functionName: String = #function) {
        print("LOG:: ✔︎\(functionName): \(logMessage)")
    }
}
