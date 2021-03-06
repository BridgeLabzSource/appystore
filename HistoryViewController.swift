//
//  HistoryViewController.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 23/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,HistoryViewControllerProtocol{

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mGoToLogoutScreenLabel: UIButton!
    @IBOutlet weak var mVideoLabel: UIButton!
    @IBOutlet weak var mHistoryLabel: UIButton!
    @IBOutlet weak var mSearchLabel: UIButton!
    @IBOutlet weak var mCartLabel: UIButton!
    
    
    var mHistroyControllerObj : HistoryController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!)
        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!)
        collectionView.collectionViewLayout = CustomViewFlowLayout(width : CGRectGetWidth(self.view.frame))
        mChangeButtonImage()
        mHistroyControllerObj = HistoryController(histroyObj: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mHistroyControllerObj.mHistoryListCount
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SubCategoryCollectionViewCell", forIndexPath: indexPath) as! SubCategoryViewCell
        cell.videoNameLabel.text = mHistroyControllerObj.mHistoryList[indexPath.row]["title"] as? String
        let duration = Int(self.mHistroyControllerObj.mHistoryList[indexPath.row]["content_duration"] as! String)
        cell.videoDurationDisplayLabel.text = "\(duration!/60):\(duration!%60)"
        

        return cell
    }

    func updateHistoyViewController(){
        collectionView.reloadData()
    }
    
    @IBAction func mGoToLogOutScreenButton(sender: UIButton) {
        performSegueWithIdentifier("HistoryToLogOutScreen", sender: nil)
    }
    
    @IBAction func mVideoButton(sender: UIButton) {
        performSegueWithIdentifier("HistoryToCategory", sender: nil)
    }
    
    @IBAction func mHistoryButton(sender: UIButton) {
    }
    
    @IBAction func mSearchButton(sender: UIButton) {
        performSegueWithIdentifier("HistoryToSearch", sender: nil)
    }
    
    @IBAction func mCartButton(sender: UIButton) {
    }
    
    
    
    func mChangeButtonImage () {
        mGoToLogoutScreenLabel.setImage(UIImage(named: "ladyimage"), forState: UIControlState.Normal)
        mVideoLabel.setImage(UIImage(named: "videoimage"), forState: UIControlState.Normal)
        mHistoryLabel.setImage(UIImage(named: "historyimage"), forState: UIControlState.Normal)
        mSearchLabel.setImage(UIImage(named: "searchimage"), forState: UIControlState.Normal)
        mCartLabel.setImage(UIImage(named: "carimage"), forState: UIControlState.Normal)
    }
    
    
    
    
    
    
    
    
}
