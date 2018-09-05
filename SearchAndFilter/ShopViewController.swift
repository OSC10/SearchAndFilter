//
//  ShopViewController.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 05/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ShopTableViewCellDelegate {

    @IBOutlet var shopTableView: UITableView!
    
    let shopList = ["Gold Merchant", "Official Store"]
    var activeFilter = [String]()
    var delegate : ShopViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        shopTableView.dataSource = self
        shopTableView.delegate = self
        shopTableView.register(UINib(nibName: "ShopTableViewCell", bundle: nil), forCellReuseIdentifier: "shopCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // MARK: - table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = shopList[indexPath.row]
        
        let cell = shopTableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! ShopTableViewCell
        cell.setUpData(name: name)
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: - cell delegate
    func shopOnCheck(shop: String, isChecked: Bool) {
        if isChecked {
            self.activeFilter.append(shop)
        } else {
            if let index = activeFilter.index(of: shop){
                self.activeFilter.remove(at:index)
            }
        }
        
    }
    
    // MARK: - action function
    @IBAction func onClickCancel(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickReset(_ sender: UIButton) {
        for word in activeFilter {
            if let index = activeFilter.index(of: word){
                self.activeFilter.remove(at:index)
            }
        }
        shopTableView.reloadData()
    }
    
    @IBAction func onClickApply(_ sender: UIButton) {
        self.delegate?.onApplyShopType(shop: self.activeFilter)
        
        navigationController?.popViewController(animated: true)
    }
}
