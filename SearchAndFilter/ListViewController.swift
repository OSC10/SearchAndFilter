//
//  ListViewController.swift
//  SearchAndFilter
//
//  Created by Owen Cahyadi on 03/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ProductConnectionManagerDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    var productList = [ProductModel]()
    var productManager : ProductConnectionManager? = ProductConnectionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        productManager?.delegate = self
        productManager?.loadProduct()
    }
    
    //MARK: collection view delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Product", for: indexPath) as! ProductCell
        
        let product = productList[indexPath.item]
        
        cell.fillCell(product: product)
        
        return cell
    }

    //MARK: connection manager delegate
    func connectionFinished(_ sender: ProductConnectionManager) {
        productList = (productManager?.products)!
        self.collectionView.reloadData()
    }
    
    //MARK: action function
    @IBAction func onClickFilter(_ sender: UIButton) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "Filter") as? FilterViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

