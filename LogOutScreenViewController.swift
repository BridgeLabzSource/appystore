//
//  LogOutScreenViewController.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 27/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class LogOutScreenViewController: UIViewController {

    
    
    var mLogOutScreenControllerObj : LoginViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mLogOutScreenControllerObj = LoginViewController()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func mBackToChildrenAreaButton(sender: UIButton) {
        performSegueWithIdentifier("BackToCategory", sender: nil)
    }

    @IBAction func mLogOutButton(sender: UIButton) {
        performSegueWithIdentifier("ToLoginScreen", sender: nil)
    }
    
    @IBAction func mChildDetailsButton(sender: UIButton) {
    }
    
    @IBAction func mChildProgressButton(sender: UIButton) {
    }
    
    @IBAction func mParentingVideoButton(sender: UIButton) {
        
    }

    
    @IBAction func mViewPlanButton(sender: UIButton) {
    }
    
    @IBAction func mRateTheAppButton(sender: UIButton) {
    }
    
    
    @IBAction func mShareTheAppButton(sender: UIButton) {
    }
    
    
}
