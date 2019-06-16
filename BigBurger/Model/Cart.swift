//
//  Cart.swift
//  BigBurger
//
//  Created by admin on 6/16/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
class Cart
{
    static let currentCart = Cart()
    var items = [Food]()
    
    func getTotalPrice()-> String {
        //This method return total price Cart in Lira.
        var totalPrice = 0.0
        for item in items {
            totalPrice += Double(item.price! / 100) * Double(item.orderNumber)
        }
        return "\(totalPrice) ₺‎"
    }

}
