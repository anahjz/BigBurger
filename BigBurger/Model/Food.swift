//
//  Food.swift
//  BigBurger
//
//  Created by admin on 6/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import SwiftyJSON

class Food {
    var ref: String?
    var title: String?
    var description: String?
    var image: String?
    var price: Int?
    var orderNumber: Int = 0
    
    init(json: JSON){
        ref = json["ref"].string
        title = json["title"].string
        description = json["description"].string
        image = json["thumbnail"].string
        price = json["price"].intValue
        
    }
    
    func priceInLira() -> String {
        guard let price = self.price else{
            return "0.0"
        }
        let numberStr = "\(Double(price/100) )‎₺‎"
        return numberStr
    }
    
    func totalOrdredFoodPrice() -> String {
        //This method return total price of a food that ordered.price is price of food and order number is number of ordered of this food in current cart.
        guard let price = self.price else{
            return "0.0"
        }
        let numberStr = "\(Double(price/100) * Double (self.orderNumber) )‎₺‎"
        return numberStr
    }
}




