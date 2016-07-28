//
//  SubCategoryViewContoller.swift
//  AppyStoreApplication
//  Purpose
//  1. This class display display all videos of selected category
//  2. And play video
//
//  Created by BridgeIt on 16/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import AVKit
import AVFoundation

class SubCategoryViewContoller: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,SubCategoryViewContollerProtocol {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mBackButtonLabel: UIButton!
    
    @IBOutlet weak var mVideoButtonLabel: UIButton!
    
    @IBOutlet weak var mHistoryButtonLabel: UIButton!
    
    @IBOutlet weak var mSearchButtonLabel: UIButton!
    
    @IBOutlet weak var mCartButtonLabel: UIButton!
    
    var mHistory   = NSMutableArray()
    var mSubCategoryControllerObj : SubCategoryController!
    var mVideoPlayer : AVPlayer!
    var mPlayerViewController : AVPlayerViewController!
    var index : Int!
    var historyChecker = false
    var mSelectedCategory : AnyObject?
    var mSelectedCategoryCount = 0
    var ListCount = 0
    
    override func viewDidLoad() {
        collectionView.collectionViewLayout = CustomViewFlowLayout(width : CGRectGetWidth(self.view.frame))
        mChangeButtonImage()
        mVideoButtonLabel.setImage(UIImage(named: "videobackground.png"), forState: UIControlState.Normal)
        super.viewDidLoad()
        mSubCategoryControllerObj = SubCategoryController()
        
        mSubCategoryControllerObj.mGetSubCategoryDetails(self , category: mSelectedCategory,offset : ListCount)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!)
        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return mSubCategoryControllerObj.mSubCatagoryList.count
    }
    
    //method to create collection view cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SubCategoryCollectionViewCell", forIndexPath: indexPath) as! SubCategoryViewCell
        cell.videoNameLabel.text = mSubCategoryControllerObj.mSubCatagoryList[indexPath.row]["title"] as? String
        cell.videoImageVIew.image = UIImage(named: "loading_img.png")
        //Fetch video image
        Alamofire.request(.GET, self.mSubCategoryControllerObj.mSubCatagoryList[indexPath.row]["image_path"] as! String)
            .responseImage { response in
                cell.videoImageVIew.stopAnimating()
                if (response.result.value != nil) {
                    cell.videoImageVIew.image = response.result.value
                }
                else {
                    cell.videoImageVIew.image = UIImage(named: "loading_img.png")
                }
                cell.videoDurationDisplayLabel.backgroundColor = UIColor(patternImage: UIImage(named: "videos_categories_play__tranparent_box.png")!)
                let duration = Int(self.mSubCategoryControllerObj.mSubCatagoryList[indexPath.row]["content_duration"] as! String)
                cell.videoDurationDisplayLabel.text = "\(duration!/60):\(duration!%60)"
        }

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        index = indexPath.row
        mHistory.addObject(indexPath.row as Int)
        let url = NSURL(string: mSubCategoryControllerObj.mSubCatagoryList[index]["dnld_url"] as! String)
        mVideoPlayer = AVPlayer(URL: url!)
        mPlayerViewController = AVPlayerViewController()
        
        mPlayerViewController.player = mVideoPlayer
        self.presentViewController(mPlayerViewController, animated: true ){
            self.mPlayerViewController.player?.play()
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        ListCount += 9
        if (ListCount < mSubCategoryControllerObj.mSubCategoryListCount) {
            mSubCategoryControllerObj.mGetSubCategoryDetails(self , category: mSelectedCategory,offset : ListCount)
        }
        else {
            
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
    //Method to update collection view
    func updateCollectionVIew () {        
        collectionView.reloadData()
    }
    
    @IBAction func mBackButton(sender: UIButton) {

        mChangeButtonImage()
        mBackButtonLabel.setImage(UIImage(named: "backY.png"), forState: UIControlState.Normal)
        performSegueWithIdentifier("CategoryView", sender: nil)
        
    }
    
    @IBAction func mVideoButton(sender: UIButton) {
        mChangeButtonImage()
        mVideoButtonLabel.setImage(UIImage(named: "videobackground.png"), forState: UIControlState.Normal)
        
    }
    
    @IBAction func mHistoryButton(sender: UIButton) {
        mChangeButtonImage()
        mHistoryButtonLabel.setImage(UIImage(named: "historybackground.png"), forState: UIControlState.Normal)
        performSegueWithIdentifier("SubCategoryToHistory", sender: nil)
    }
    
    @IBAction func mSearchButton(sender: UIButton) {
        mChangeButtonImage()
        mSearchButtonLabel.setImage(UIImage(named: "searchbackground.png"), forState: UIControlState.Normal)
    }
    
    @IBAction func mCartButton(sender: UIButton) {
        mChangeButtonImage()
        mCartButtonLabel.setImage(UIImage(named: "cartbackground.png"), forState: UIControlState.Normal)
        
    }
    //method to change background image of buttons
    func mChangeButtonImage () {
        mBackButtonLabel.setImage(UIImage(named: "backarrow.png"), forState: UIControlState.Normal)
        mVideoButtonLabel.setImage(UIImage(named: "videoimage.png"), forState: UIControlState.Normal)
        mHistoryButtonLabel.setImage(UIImage(named: "historyimage.png"), forState: UIControlState.Normal)
        mSearchButtonLabel.setImage(UIImage(named: "searchimage.png"), forState: UIControlState.Normal)
        mCartButtonLabel.setImage(UIImage(named: "carimage.png"), forState: UIControlState.Normal)
    }   
}
