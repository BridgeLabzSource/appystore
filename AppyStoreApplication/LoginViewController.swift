//
//  LoginViewController.swift
//  AppyStoreProject
//
//  Created by BridgeLabz on 18/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var labellogin: UILabel!
    
    @IBOutlet weak var loginview: UIView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loginview.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!)
        //loginview.layer.contents = UIImage(named:"backgroundimage")!.CGImage
        //labellogin.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage")!)
        labellogin.text="Welcome to Appystore"
        labellogin.layer.cornerRadius = 0.0;
        labellogin.layer.masksToBounds = true;
        //labellogin.layer.borderColor=UIColor .redColor().CGColor
        
            
        }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func myButtonTapped(sender: AnyObject) {
        
        
        let TableViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailViewController") as! CategoryViewController
        self.navigationController?.pushViewController(TableViewController, animated: true)
        

        
        
        
           }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
