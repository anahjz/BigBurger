//
//  MenuCell.swift
//  BigBurger
//
//  Created by admin on 6/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    var food: Food? {
        didSet {
            updateUI()
        }
    }
    
    
    override func awakeFromNib() {
        
        
    }
    override func layoutSubviews() {
    }
    
    private func updateUI(){
        
        func updateFoodImage(){
            guard let image = food?.image else {
                return self.foodImage.image = UIImage(named: "placeholder" )
            }
            let imageUrl = URL(string: image)
            self.foodImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"))
        }
        
        func updateFoodName() {
            guard let name = food?.title else {
                return self.foodName.text = "title is empty"
            }
            self.foodName.text = name
        }
        
        func updateFoodDescription() {
            guard let desc = food?.description else {
                return self.foodDescription.text = "description is empty"
            }
            self.foodDescription.text = desc
        }
        
        func updateFoodPrice() {
            guard let price = food?.priceInLira() else {
                return self.foodPrice.text = "0.0"
            }
            self.foodPrice.text = price
        }
        
        updateFoodImage()
        updateFoodName()
        updateFoodDescription()
        updateFoodPrice()
    }
}
