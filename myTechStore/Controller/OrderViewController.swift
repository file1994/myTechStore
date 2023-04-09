//
//  OrderViewController.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 23.05.22.
//

import UIKit
import CoreData

class OrderItem: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemPrice: UILabel!
    
}

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    var orderItems = [ItemForOrder]()
    
    @IBOutlet weak var orderTableView: UITableView!
    
    @IBOutlet weak var btnEdit: UIBarButtonItem!
    
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    
    
    @IBOutlet weak var lblTotal: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.orderTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        orderTableView.reloadData()
        checkPrice(orderItem: orderItems)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderItem", for: indexPath) as! OrderItem
        let rowData = orderItems[indexPath.row]
        cell.lblItemName.text = rowData.selectedItem.name
        cell.lblItemPrice.text = String(rowData.total) + " $"
        let url = rowData.selectedItem.imageURL
        cell.itemImageView.image = UIImage(named: url.relativeString)
        cell.itemImageView.contentMode = .scaleAspectFill
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            orderItems.remove(at: indexPath.item)
            orderTableView.deleteRows(at: [indexPath], with: .automatic)
            self.navigationController?.tabBarController?.tabBar.items![3].badgeValue = String(orderItems.count)
            checkPrice(orderItem: orderItems)
        }
    }
    
    
    @IBAction func btnEditTapped(_ sender: Any) {
        orderTableView.isEditing = !orderTableView.isEditing
        
        switch orderTableView.isEditing {
        case true:
            btnEdit.title = "Done"
        case false:
            btnEdit.title = "Edit"
        }
    }
    
    func setupAlert(title: String, message: String) {
             
        let alert = UIAlertController(title:  title, message: message, preferredStyle: .alert)
             
            if orderItems.count > 0 {
                alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
                    
                    self.confirmOrder()
                    self.orderItems.removeAll()
                    self.orderTableView.reloadData()
                    self.checkPrice(orderItem: self.orderItems)
                    self.navigationController?.tabBarController?.tabBar.items![3].badgeValue = String(self.orderItems.count)
                    
                    self.performSegue(withIdentifier: "OrderConfirmed", sender: self)
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            }
            else {
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            }
            present(alert, animated: true)
        }
    
    var totalPrice = 0.0
    
    @IBAction func btnSubmitTapped(_ sender: Any) {
        for item in orderItems {
            totalPrice += item.total
        }
        
        if orderItems.count > 0 {
            let title = "Confirm your order."
            let message = "Total cost: \(totalPrice) $"
            setupAlert(title: title, message: message)
            confirmOrderAnimation()
        }
        else {
            let title = "Your cart is empty."
            let message = ""
            setupAlert(title: title, message: message)
            emptyOrderAnimation()
            
        }
        totalPrice = 0.0
    }
    
    var total = 0.0
    
    func checkPrice(orderItem: [ItemForOrder]) {
        if orderItems.count == 0 {
            total = 0.0
            lblTotal.text = String(total) + " $"
        } else {
            for orderItem in orderItems {
                total += orderItem.total
                lblTotal.text = String(total) + " $"
                
            }
            total = 0.0
        }
            
    }
    
    func confirmOrder() {
        
        let newOrder = Order(menuItems: self.orderItems, date: Date())
        let total = Double(lblTotal.text!.replacingOccurrences(of: " $", with: ""))
        self.save(date: newOrder.date, totalPrice: total!)
    }
    
    func emptyOrderAnimation() {
            UIView.animate(withDuration: 0.1, animations: {
                self.btnSubmit.transform = CGAffineTransform(translationX: 5, y: 0)
                self.btnSubmit.backgroundColor = .systemPink
            }, completion: {(_) in
                UIView.animate(withDuration: 0.1, animations: {
                    self.btnSubmit.transform = CGAffineTransform(translationX: -10, y: 0)
                    self.btnSubmit.backgroundColor = .systemBlue
                }, completion: {(_) in
                    UIView.animate(withDuration: 0.1, animations: {
                      self.btnSubmit.transform = CGAffineTransform(translationX: -5, y: 0)
                    })
                })
            })
        }
    
    func confirmOrderAnimation() {
            UIView.animate(withDuration: 0.25, animations: {
                self.btnSubmit.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.btnSubmit.backgroundColor = .systemGreen
            }, completion: {(_) in
                UIView.animate(withDuration: 0.25, animations: {
                    self.btnSubmit.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.btnSubmit.backgroundColor = .systemBlue
                })
            })
        }
    
    @IBAction func unwindToOrder(unwindSegue: UIStoryboardSegue){
        
    }
    
}
extension OrderViewController {
     
    func save(date: Date, totalPrice: Double) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
         guard let entityDescription = NSEntityDescription.entity(forEntityName: "OrderToSaveMO", in: context) else {return}
 
            let newOrder = NSManagedObject(entity: entityDescription, insertInto: context)
            newOrder.setValue(date, forKey: "date")
            newOrder.setValue(totalPrice, forKey: "totalPrice")
            do {
                try context.save()
                print("saved!!! \(newOrder)")
            }
            catch {
                print("Saving Error")
            }
        }
    }
}
