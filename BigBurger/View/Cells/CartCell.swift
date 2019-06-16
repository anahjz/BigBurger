//
//  CartCell.swift
//  BigBurger
//
//  Created by admin on 6/16/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var item: Food? {
        didSet {
            updateUI()
        }
    }
    
    
    private func updateUI(){
        
        func updateOrderNumberLabel(){
            guard let number = item?.orderNumber else {
                return self.orderNumberLabel.text = "0"
            }
            self.orderNumberLabel.text = String(number)
        }
        
        func updateNameLabel() {
            guard let name = item?.title else {
                return self.nameLabel.text = "title is empty"
            }
            self.nameLabel.text = name
        }
        
        func updatePriceLabel() {
            guard let price = item?.totalOrdredFoodPrice() else {
                return self.priceLabel.text = "0.0"
            }
            self.priceLabel.text = price
        }
        
        updateOrderNumberLabel()
        updateNameLabel()
        updatePriceLabel()
    }
}
