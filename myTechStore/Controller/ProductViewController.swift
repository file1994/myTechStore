//
//  ProductViewController.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 23.05.22.
//

import UIKit

class ProductCell: UITableViewCell{
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
}
class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard
    
    var categoriesToShow: [Categories] = []
    
    func getCategories(){
        for cat in ProductData.categories {
            categoriesToShow.append(cat)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category") as! ProductCell
        let rowData = categoriesToShow[indexPath.row]
        let url = rowData.categoryImageURL
        cell.catImageView.image = UIImage(named: url.relativeString)
        cell.categoryName.text = rowData.categoryName.capitalized
        cell.catImageView.contentMode = .scaleToFill
        return cell
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true

    
        getCategories()
        self.tableView.tableFooterView = UIView()
        checkUserInterfaceStyle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategorySegue" {
            let itemsTableViewController = segue.destination as! ItemsTableViewController
            
            let index = tableView.indexPathForSelectedRow!.row
            itemsTableViewController.category = categoriesToShow[index].categoryName
            itemsTableViewController.navigationItem.title = categoriesToShow[index].categoryName.capitalized
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    @IBAction func btnChangeUIStyleTapped(_ sender: Any) {
        let isDarkModeEnabled = defaults.bool(forKey: "isDarkMode")
        
        if isDarkModeEnabled == true {
            defaults.set(false, forKey: "isDarkMode")
        }
        else if isDarkModeEnabled == false {
            defaults.set(true, forKey: "isDarkMode")
        }
        for win in UIApplication.shared.windows {
            if defaults.bool(forKey: "isDarkMode") {
                win.overrideUserInterfaceStyle = .dark
            }
            else {
                win.overrideUserInterfaceStyle = .light
            }
        }
        checkUserInterfaceStyle()
    }
    
    func checkUserInterfaceStyle() {
        if defaults.bool(forKey: "isDarkMode") == true {
            self.navigationItem.leftBarButtonItem!.title = "Light mode"
        }
        else if defaults.bool(forKey: "isDarkMode") == false {
            self.navigationItem.leftBarButtonItem!.title = "Dark mode"
        }
    }
    
    

   

}
