//
//  SearchBarViewController.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 22/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate   {

    @IBOutlet weak var mSearchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var array = NSMutableArray()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.grayColor()
        return cell

    }
    
    func updataSearchViewController (list : AnyObject) {
        
    }

    
    

}
