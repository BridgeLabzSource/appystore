//
//  HistoryViewController.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 23/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,HistoryViewControllerProtocol{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HistoryCell", forIndexPath: indexPath) 
        
        return cell
    }

    func updateHistoyViewController(){
        
    }
}
