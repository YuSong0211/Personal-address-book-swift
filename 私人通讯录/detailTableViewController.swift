//
//  detailTableViewController.swift
//  私人通讯录
//
//  Created by  椒徒科技 on 16/8/2.
//  Copyright © 2016年 jiaotukeji. All rights reserved.
//

import UIKit

class detailTableViewController: UITableViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var titletText: UITextField!
    
    var p : person?
    
    override func viewDidLoad() {
        if p != nil {
            
            nameText.text = p?.name
            phoneText.text = p?.phone
            titletText.text = p?.title
        }
        
    }
    
    var backcCompletion:(()->())?
    
    @IBAction func saveClick(sender: AnyObject) {
        
        if p == nil {
            p = person()
        }
        
        p?.name = nameText.text
        p?.phone = phoneText.text
        p?.title = titletText.text
        
        backcCompletion?()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
