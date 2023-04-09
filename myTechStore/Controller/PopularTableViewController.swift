//
//  PopularTableViewController.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 23.05.22.
//

import UIKit

class PopularCell: UITableViewCell {
    @IBOutlet weak var itemImgView: UIImageView!
    
    @IBOutlet weak var lblItemName: UILabel!
    
    @IBOutlet weak var lblItemPrice: UILabel!
    
    
}


class PopularTableViewController: UITableViewController {

    var itemsToShow = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPopularItems()

        self.tableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getPopularItems() {
        for item in ProductData.popularItems {
            self.itemsToShow.append(item)
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToShow.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularItemCell", for: indexPath) as! PopularCell
        
        let rowData = itemsToShow[indexPath.row]
        let url = rowData.imageURL
        cell.itemImgView.image = UIImage(named: url.relativeString)
        cell.lblItemName.text = rowData.name
        cell.lblItemPrice.text = String(rowData.price) + " $"
        cell.itemImgView.contentMode = .scaleAspectFill

        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PopularItemDetails" {
            let itemDetailsViewController = segue.destination as! ItemDetailsViewController
            let index = tableView.indexPathForSelectedRow!.row
            itemDetailsViewController.selectedItem = itemsToShow[index]
        }
    }


}
