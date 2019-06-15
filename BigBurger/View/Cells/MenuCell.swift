//
//  MenuCell.swift
//  BigBurger
//
//  Created by admin on 6/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    
    var food: Food? {
        didSet {

        }
    }
    
    override func awakeFromNib() {
        
    }
    
    private func updateUI(){
        func updateFoodImage(){}
        func updateFoodName(){}
        func updateFoodDescription(){}
        func updateFoodPrice(){}
    }
}
