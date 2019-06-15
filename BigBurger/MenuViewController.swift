//
//  ViewController.swift
//  BigBurger
//
//  Created by admin on 6/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SVProgressHUD
class MenuViewController: UITableViewController {

    private var foods: NSArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            self.tableView.reloadData()
        }
    }
    
    private func getMenuFailure(error: Error) {
        Helper.getInstance().errorInLoading()
        Helper.getInstance().log(logMessage: "Failed to load menu : \(error)")
    }
}

extension MenuViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        guard let foods = self.foods else {
            return cell
        }
        cell.food = foods[indexPath.row] as? Food
        return cell
    }
}
