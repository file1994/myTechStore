//
//  OrderCompletedViewController.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 23.05.22.
//

import UIKit

class OrderCompletedViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var completeImage: UIImageView!
    
    @IBOutlet weak var descriptionTv: UITextView!
    
    @IBOutlet weak var btnDismiss: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnDismiss.setTitle("Dismiss", for: .normal)
        descriptionTv.text = "Your order has been accepted!\nExpect your delivery in 3-5 days!"
        descriptionTv.isUserInteractionEnabled = false
        completeImage.image = UIImage(named: "order")
        
        
    }
    

}
