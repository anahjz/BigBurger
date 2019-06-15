//
//  Api.swift
//  BigBurger
//
//  Created by admin on 6/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Api {
    let baseUrl: String;
    static let shared = Api()
    
    init() {
        let environmentPlistName = "URL"
        let plistPath = Bundle.main.path(forResource: environmentPlistName, ofType: "plist")
        let apiDic = NSDictionary(contentsOfFile: plistPath!)
        self.baseUrl = "\(apiDic!["BaseUrl"]!)"
    }
    
    
func getMenu(with url: String,_ success: @escaping (_ foods: NSArray?)->Void,  failure: @escaping (_ error: Error)->Void) {
        let fullUrl = "\(baseUrl)/\(url)"
        Alamofire.request(fullUrl).responseJSON { (response) -> Void in
            if let error = response.error {
                failure(error)
                return
            }
            var foods: [Food]? = []
            if((response.result.value) != nil) {
                let json = JSON(response.result.value!)
                for food in json.arrayValue {
                    foods?.append(Food(json: food))
                }
            }
            success(foods as NSArray?)
        }
    }
}
