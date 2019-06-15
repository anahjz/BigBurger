//
//  Helper.swift
//  BigBurger
//
//  Created by admin on 6/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import SVProgressHUD

open class Helper: NSObject
{
    fileprivate static let instance = Helper()
    
    
    public static func getInstance() -> Helper {
        return .instance
    }
    
    func log(logMessage: String, functionName: String = #function) {
        print("LOG:: ✔︎\(functionName): \(logMessage)")
    }
    
    func startLoading() {
        SVProgressHUD.show(withStatus: "PleaseWait")
    }
    
    func errorInLoading() {
        SVProgressHUD.showError(withStatus: "Error in loading data")
    }
    
    func dissmissLoading() {
        SVProgressHUD.dismiss()
    }
}
