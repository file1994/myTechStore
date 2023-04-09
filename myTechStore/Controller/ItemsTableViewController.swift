//
//  ItemsTableViewController.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 23.05.22.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var lblItemName: UILabel!
    
    @IBOutlet weak var lblItemPrice: UILabel!
    
}

class ItemsTableViewController: UITableViewController {
    
    var category: String = ""
    var itemsToShow: [Item] = []
    
    func getProductItems(categoryName: String) {
        for item in ProductData.productItems {
            if category == item.category {
                itemsToShow.append(item)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        getProductItems(categoryName: category)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToShow.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as! ItemCell

        let rowData = itemsToShow[indexPath.row]
        let url = rowData.imageURL
        cell.itemImageView.image = UIImage(named: url.relativeString)
        cell.lblItemName.text = rowData.name
        cell.lblItemPrice.text = String(rowData.price) + " $"
        cell.itemImageView.contentMode = .scaleAspectFill

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetails" {
            let itemDetailsViewController = segue.destination as! ItemDetailsViewController
            let index = tableView.indexPathForSelectedRow!.row
            itemDetailsViewController.selectedItem = itemsToShow[index]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}
