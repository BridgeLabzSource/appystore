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
    
    var array = NSMutableArray()
    var mSearchControllerObj = SearchController()
    var mSearchBarCellObj = SearchBarCollectionViewCell()
    var mVideoPlayer : AVPlayer!
    var mPlayerViewController : AVPlayerViewController!
    var cellobj = SearchBarCollectionViewCell()
    let label = UILabel()
    var searchButtonShow : Bool = true
    var Sview = UIView(frame: CGRect(x: 0, y: 0, width: 540, height: 60))
    var sViewButton : UIButton!
    var checker : Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!)
        collectionView.registerNib(UINib(nibName: "SearchBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchBarCell")
        backButtonLabel.setImage(UIImage(named: "backarrow.png"), forState: UIControlState.Normal)
        searchButtonLabel.setImage(UIImage(named: "searchimage.png"), forState: UIControlState.Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(mSearchControllerObj.mSearchCategoryList.count)
        return mSearchControllerObj.mSearchCategoryList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if checker != true {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SearchBarCollectionViewCell
            
            
            return cell
            
        }
        else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SearchBarCell", forIndexPath: indexPath) as! SearchBarCollectionViewCell
            cell.mVideoImage.image = UIImage(named: "loading_img.png")
            cell.mVideoNameLabel.text = self.mSearchControllerObj.mSearchCategoryList[indexPath.row]["title"] as? String
            
            //Fetch video image
            Alamofire.request(.GET, "http://s.mobimgs.com/m/%217YzqfmB2xlvxWZhs6NK4u0UCduaKvts8yS%21vhlN%21Z447cg8Hv8Al8zwoy2LyPCntDbdyPS97VQFsvZ5f5Y5MbilpEYs79CfQYxRqk%21xMmE%3D/20077841.mp4.jpg")
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
//        var reuseableCell = UICollectionReusableView()
//        reuseableCell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "", forIndexPath: indexPath) as! SearchBarMenu
//        
//        return reuseableCell
        
        let headerView =
        collectionView.dequeueReusableSupplementaryViewOfKind(kind,
            withReuseIdentifier: "CollectionViewHeader",
            forIndexPath: indexPath)
            as! SearchBarMenu
        
    //    headerView.label.text = labels[indexPath.section]
        
        return headerView
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
            print("false")
            collectionView.backgroundView = label

        }
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("SearchToCategory", sender: nil)
    }
    
    @IBAction func searchButtonPressed(sender: UIButton) {
        Sview.hidden = true
        if searchButtonShow {

            if inputTextField.text == "" {
                
            }
            else {
                searchButtonShow = false
                collectionView.reloadData()
                label.hidden = true
                mSearchControllerObj = SearchController(SviewProtocolObj: self, inputText: inputTextField.text!)
                searchButtonLabel.setImage(UIImage(named: "close_icon_light"), forState: UIControlState.Normal)
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

    
    

}
