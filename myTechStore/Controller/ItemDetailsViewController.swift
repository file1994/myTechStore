//
//  ItemDetailsViewController.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 23.05.22.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var tvDetails: UITextView!
    @IBOutlet weak var detailsItemImage: UIImageView!
    
    @IBOutlet weak var lblPricePerPortion: UILabel!
    
    @IBOutlet weak var btnAddToOrder: UIButton!
    
    var selectedItem: Item!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        fillDetails(selectedItem: selectedItem)
    }
    
    func fillDetails(selectedItem: Item) {
        lblName.text = selectedItem.name
        let url = selectedItem.imageURL
        detailsItemImage.image = UIImage(named: url.relativeString)
        tvDetails.text = selectedItem.details
        tvDetails.isUserInteractionEnabled = false
        lblPricePerPortion.text = "Price: \(selectedItem.price) $"
        self.navigationItem.title = "Details"
        btnAddToOrder.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

    func addToOrder() {
        var orderPrice: Double = selectedItem.price
        var itemToAdd = ItemForOrder(selectedItem: selectedItem, total: orderPrice)
        print("Your order: \(itemToAdd.selectedItem.name), price: \(itemToAdd.total)")
        
        let navController = self.tabBarController?.viewControllers![3] as! UINavigationController
        let vc = navController.topViewController as! OrderViewController
        vc.orderItems.append(itemToAdd)
        
        self.navigationController?.tabBarController?.tabBar.items![3].badgeValue = String(vc.orderItems.count)
        self.navigationController?.tabBarController?.tabBar.items![3].badgeColor = .systemBlue
        
    }
    
    @IBAction func btnAddTapped(_ sender: Any) {
        addToOrder()
        UIView.animate(withDuration: 0.25, animations: {
            self.btnAddToOrder.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.btnAddToOrder.backgroundColor = .systemGreen
        }, completion: {(_) in
            UIView.animate(withDuration: 0.25, animations: {
                self.btnAddToOrder.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.btnAddToOrder.backgroundColor = .systemBlue
            })
        })
    }
    
}
