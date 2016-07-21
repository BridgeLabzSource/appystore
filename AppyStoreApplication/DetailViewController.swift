//
//  DetailViewController.swift
//  AppyStoreProject
//
//  Created by BridgeLabz on 18/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var categoryid: Int!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
           let defaults = NSUserDefaults.standardUserDefaults()
  let array = defaults.objectForKey("category_id1") as? String 
      print(array!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoprevious(sender: UIButton) {
        
        
        navigationController?.popViewControllerAnimated(true)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
