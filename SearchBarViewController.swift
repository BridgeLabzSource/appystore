//
//  SearchBarViewController.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 22/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import Alamofire
import AVKit
import AVFoundation

class SearchBarViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,SearchViewControllerProtocol   {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var backButtonLabel: UIButton!
    
    @IBOutlet weak var searchButtonLabel: UIButton!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    var mSearchControllerObj = SearchController()
    var mVideoPlayer : AVPlayer!
    var mPlayerViewController : AVPlayerViewController!
    let label = UILabel()
    var searchButtonShow : Bool = true
    var Sview = UIView(frame: CGRect(x: 0, y: 0, width: 540, height: 60))
    var sViewButton : UIButton!
    var headerViewChecker : Bool = true
    var ListCount = 0
    var searchKeyword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mSearchControllerObj = SearchController()
    collectionView.collectionViewLayout = CustomViewFlowLayout(width : CGRectGetWidth(self.view.frame))   //to set layout for collection view
        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!) //to set background image for collection view
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!) // to set background image for view
        collectionView.registerNib(UINib(nibName: "SearchBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchBarCell")
        backButtonLabel.setImage(UIImage(named: "backarrow.png"), forState: UIControlState.Normal) //to set back button image
        searchButtonLabel.setImage(UIImage(named: "searchimage.png"), forState: UIControlState.Normal) //to set search button image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mSearchControllerObj.mSearchCategoryList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SearchBarCell", forIndexPath: indexPath) as! SearchBarCollectionViewCell
            cell.mVideoImage.image = UIImage(named: "loading_img.png")
            cell.mVideoNameLabel.text = self.mSearchControllerObj.mSearchCategoryList[indexPath.row]["title"] as? String
            
            //Fetch video image
            Alamofire.request(.GET, mSearchControllerObj.mSearchCategoryList[indexPath.row]["image_path"] as! String)
                .responseImage { response in
                    if (response.result.value != nil) {
                        cell.mVideoImage.image = response.result.value
                    }
                    else {
                        cell.mVideoImage.image = UIImage(named: "loading_img.png")
                    }
        }
         return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let url = NSURL(string: mSearchControllerObj.mSearchCategoryList[indexPath.row]["dnld_url"] as! String)
        mVideoPlayer = AVPlayer(URL: url!)
        mPlayerViewController = AVPlayerViewController()
        
        mPlayerViewController.player = mVideoPlayer
        self.presentViewController(mPlayerViewController, animated: true ){
        self.mPlayerViewController.player?.play()
        }
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {

        let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", forIndexPath: indexPath) as! CollectionReusableView
        cell.mSetBorder()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
            if (headerViewChecker != true ){
                return CGSizeZero
            }
            else {
                   return CGSize(width: (view.frame.size.width), height: 90)
            }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        ListCount += 9
        if (ListCount < mSearchControllerObj.mSearchCategoryListCount) {
            mSearchControllerObj.mGetSearchDetails(self, inputText: searchKeyword, offset: ListCount)
        }
        else {
            searchKeyword = ""
        }
    }
    
    func updataSearchViewController () {
        if mSearchControllerObj.mSearchCategoryList.count > 0 {
            collectionView.reloadData()
        }
        else {
            label.hidden = false
            label.textAlignment = NSTextAlignment.Center
            label.text = "Records Not Found"
            label.textColor = UIColor.whiteColor()
            collectionView.backgroundView = label
        }
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("SearchToCategory", sender: nil)
    }
    
    @IBAction func searchButtonPressed(sender: UIButton) {
        searchKeyword = inputTextField.text!
        Sview.hidden = true
        headerViewChecker = false
        if searchButtonShow {
            
            if inputTextField.text == "" {
                
            }
            else {
                searchButtonShow = false
                collectionView.reloadData()
                label.hidden = true
                mSearchControllerObj.mGetSearchDetails(self, inputText: searchKeyword, offset: ListCount)
                searchButtonLabel.setImage(UIImage(named: "close"), forState: UIControlState.Normal)
            }
        }
        else {
            searchButtonLabel.setImage(UIImage(named: "searchimage.png"), forState: UIControlState.Normal)
            searchButtonShow = true
            inputTextField.text = ""
        }
    }
    
    func mCreateSubVIew() {
        Sview.backgroundColor = UIColor.blackColor()
        collectionView.addSubview(Sview)
     
    }
    
    @IBAction func CollectionReusableViewButton(sender: UIButton) {
        
        switch(sender.tag) {
        case 1 :
            inputTextField.text = "Rhymes"
            break
        case 2 :
            inputTextField.text = "letters"
            break
        case 3 :
            inputTextField.text = "counting"
            break
        case 4 :
            inputTextField.text = "drawing"
            break
        case 5 :
            inputTextField.text = "science"
            break
        case 6 :
            inputTextField.text = "numbers"
            break
        case 7 :
            inputTextField.text = "puzzles"
            break
        case 8 :
            inputTextField.text = "ABC"
            break
        case 9 :
            inputTextField.text = "reading"
            break
        case 10 :
            inputTextField.text = "alphabet"
            break
        default : break
        }
        searchButtonPressed(sender)
    }
    
    
}
