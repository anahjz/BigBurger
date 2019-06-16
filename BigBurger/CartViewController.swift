//
//  CartViewController.swift
//  BigBurger
//
//  Created by admin on 6/16/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

class CartViewController: UITableViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 52.0
        self.totalLabel.text = "Total price:  \(Cart.currentCart.getTotalPrice())"
    }
}


extension CartViewController
{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.currentCart.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartItemCell", for: indexPath) as! CartCell
        cell.item = Cart.currentCart.items[indexPath.row]
        return cell
    }
}
