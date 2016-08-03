//
//  domeTabelViewController.swift
//  私人通讯录
//
//  Created by  椒徒科技 on 16/8/2.
//  Copyright © 2016年 jiaotukeji. All rights reserved.
//

import UIKit

class domeTabelViewController: UITableViewController {

    
    var listpserson = [person]()
    
    override func viewDidLoad() {
        
        
     loadData { (list) in
        
        self.listpserson += list as! [person]
        
        print(list)
        //s刷新表格
        self.tableView.reloadData()
        }
        
    }
    
    
    @IBAction func addListPersonClick(sender: AnyObject) {
        
        performSegueWithIdentifier("addlistperson", sender: nil)
        
    }
    //MARK:控制器跳转方法
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! detailTableViewController
        
        if let indexPath = sender as? NSIndexPath {
            
            vc.p = listpserson[indexPath.row]
            vc.backcCompletion = {
                
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            }
        }else{
        
            vc.backcCompletion = {
                
                self.listpserson.insert(vc.p!, atIndex: 0)
                
                self.tableView.reloadData()
                
            }
        
        }
        
    }
    
    //模拟网络，加载数据
    private func loadData(completion:(list:NSArray)->())  {
    
        dispatch_async(dispatch_get_global_queue(0, 0)) { 
            
            NSThread.sleepForTimeInterval(1)
            
            var Marry = [person]()
            
            for i in 0..<20 {
                
                let p = person()
                p.name = "zhangsan" + "\(i)"
                p.phone = "18911" + String(format: "%06d", arc4random_uniform(1000000))
                p.title = "boss"
                
                Marry.append(p)
            
            }
            dispatch_async(dispatch_get_main_queue(), {
                
                completion(list: Marry)
            })
            
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listpserson.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath)
        let p = listpserson[indexPath.row] as person
        cell.detailTextLabel?.text = p.phone
        cell.textLabel?.text = p.name
        
        
        return cell
        }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("list2deatil", sender: indexPath)
    }
    
}
