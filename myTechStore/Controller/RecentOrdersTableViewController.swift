//
//  RecentOrdersTableViewController.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 23.05.22.
//

import UIKit
import CoreData


class RecentOrderCell: UITableViewCell {
    
    @IBOutlet weak var lblDateOfOrder: UILabel!
    
    @IBOutlet weak var lblTotalPrice: UILabel!
    
}

class SavedOrder {
    var total: Double
    var date: Date
    
    init(total: Double, date: Date) {
        self.total = total
        self.date = date
    }
}

class RecentOrdersTableViewController: UITableViewController {

    var recentOrders = [Order]()
    
    var savedOrders = [SavedOrder]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedOrders.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetch()
        tableView.reloadData()
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentOrderCell", for: indexPath) as! RecentOrderCell
        let rowData = savedOrders[indexPath.row]
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy\n hh:mm:ss"
        let formatted = df.string(from: rowData.date)
        
        cell.lblDateOfOrder.text = formatted
        cell.lblTotalPrice.text = String(rowData.total) + " $"
        

        return cell
    }

}
extension RecentOrdersTableViewController {
    func fetch() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
             
     let request = NSFetchRequest<NSFetchRequestResult>(entityName: "OrderToSaveMO")
            do {
                let results = try context.fetch(request)
                 
                savedOrders.removeAll()
                 
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                       let date = result.value(forKey: "date") as? Date
                       let total = result.value(forKey: "totalPrice") as? Double
 
                        let savedOrder = SavedOrder(total: total!, date: date!)
                         
                        savedOrders.append(savedOrder)
                    }
                }
            }
            catch {
                print("Fetching error")
            }
        }
    }
}
