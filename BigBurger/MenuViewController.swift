//
//  ViewController.swift
//  BigBurger
//
//  Created by admin on 6/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol ChangeTotalAmount{
    func getTotalAmount(dec: Bool)
}

class MenuViewController: UIViewController, UITableViewDataSource, ChangeTotalAmount {

    private var foods: NSArray?
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var cartButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        getMenu()
    }
    
    private func getMenu() {
        Helper.getInstance().startLoading()
        let path = "dump/mobiletest1.json"
        Api.shared.getMenu(with: path, { (foods) in
            self.getMenuSuccess(foods: foods)
        }) { (error) in
            self.getMenuFailure(error: error)
        }
    }

    private func getMenuSuccess(foods: NSArray?) {
        Helper.getInstance().dissmissLoading()
        Helper.getInstance().log(logMessage: "get \(String(describing: foods?.count)) food")
        guard let foods = foods else {
            Helper.getInstance().log(logMessage: "Get menu response is nil")
            return
        }
        
        DispatchQueue.main.async {
            self.foods = foods
            self.tableview.reloadData()
        }
    }
    
    private func getMenuFailure(error: Error) {
        Helper.getInstance().errorInLoading()
        Helper.getInstance().log(logMessage: "Failed to load menu : \(error)")
    }
    
    func getTotalAmount(dec:Bool) {
        let currentAmount = self.cartButton.titleLabel?.text?.digits
        if dec {
            self.cartButton.setTitle("Cart : \((Int (currentAmount!) ?? 0) - 1) item", for: .normal)
        } else {
            self.cartButton.setTitle("Cart : \((Int (currentAmount!) ?? 0) + 1) item", for: .normal)
        }
    }
    
    fileprivate func getOrderedFood()-> [Food] {
        var cartOrder = [Food] ()
        for food in foods! {
            if (food as! Food).orderNumber > 0 {
                cartOrder.append(food as! Food)
            }
        }
        return cartOrder
    }
    
    @IBAction func goToCart(_ sender: Any) {
        self.performSegue(withIdentifier: "showCart", sender: nil)
        Cart.currentCart.items.append(contentsOf: getOrderedFood())
        }
    }


extension MenuViewController: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods?.count ?? 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.delegate = self
        guard let foods = self.foods else {
            return cell
        }
        cell.food = foods[indexPath.row] as? Food
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }

}


extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
}
