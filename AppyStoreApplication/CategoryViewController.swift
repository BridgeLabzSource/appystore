//
//  ViewController.swift
//  AppyStoreProject
//
//  Created by BridgeLabz on 16/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import Alamofire



class CategoryViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,ViewProtocol{
    @IBOutlet weak var collection: UICollectionView!

    @IBOutlet weak var firstview: UIView!
    
    
    @IBOutlet weak var first: UIButton!
    
    @IBOutlet weak var second: UIButton!
    
    @IBOutlet weak var third: UIButton!
    
    @IBOutlet weak var fourth: UIButton!
    
    @IBOutlet weak var fifth: UIButton!
    
    var idstring :String?
    var callcontroller : controller!
    var selectedIndex = 0
    
     override func viewDidLoad() {
        super.viewDidLoad()
       
       changesimages()
    
        callcontroller = controller(viewprotocolobject: self)

        
       collection.backgroundView = UIImageView(image: UIImage(named: "backgroundimage"))
        
        firstview.layer.contents = UIImage(named:"backgroundimage")!.CGImage
        
        
     
    }

func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    return callcontroller.datalist.count
    
    
}

func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    
 let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CategoryViewControllerCell
   
    
    cell.myimage.text = callcontroller.datalist[indexPath.row]["category_name"] as! String
  
   // let genreId = (callcontroller.datalist[indexPath.row]["id"] as! String).toInt()
idstring = callcontroller.datalist[indexPath.row]["parent_category_id"] as! String
   // print(idstring!)
  
    
   // print(idstring)
//
    Alamofire.request(.GET, callcontroller.datalist[indexPath.row]["image_path"]!!["50x50"] as! String).response() {
        (_, _, data, _) in
        let image = UIImage(data: data! as! NSData)
        cell.mycollectionimage.image = image
    }


    return cell
   
}

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "userSelectSegue") {
            
 //           let nextVC = segue.destinationViewController as! SubCategoryViewContoller;
           
//
//            let defaults = NSUserDefaults.standardUserDefaults()
//            defaults.setObject(idstring!, forKey: "category_id1")
           
        
        }
        let SubCategoryViewObj = segue.destinationViewController as! SubCategoryViewContoller
        SubCategoryViewObj.mSelectedCategory = callcontroller.datalist[selectedIndex]
        
        
    }
   
    //tableviewdidselectmethod
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
//        let TableViewController1 = self.storyboard!.instantiateViewControllerWithIdentifier("DetailViewController1") as! DetailViewController
//        self.navigationController?.pushViewController(TableViewController1, animated: true)
//        
//        TableViewController1.categoryid = callcontroller.datalist[indexPath.row]["category_id"] as! Int
        selectedIndex = indexPath.row
        performSegueWithIdentifier("SubCategoryView", sender: nil)
    
    
    }
    
    func updateview ()
    {
    
    collection.reloadData()
    
    }
    
    @IBAction func first1(sender: UIButton) {
        
        changesimages()
        first.setImage(UIImage(named: "ladybackground"), forState: UIControlState.Normal)
        
         }
    
  
    @IBAction func second1(sender: UIButton) {
        changesimages()
            second.setImage(UIImage(named: "videobackground"), forState: UIControlState.Normal)
    }
    
    
    
    @IBAction func third1(sender: UIButton) {
        changesimages()
            third.setImage(UIImage(named: "historybackground"), forState: UIControlState.Normal)
    }
    
    
    @IBAction func fourth1(sender: UIButton) {
        changesimages()
            fourth.setImage(UIImage(named: "searchbackground"), forState: UIControlState.Normal)
    }
    
    
    @IBAction func fifth1(sender: UIButton) {
        changesimages()
            fifth.setImage(UIImage(named: "cartbackground"), forState: UIControlState.Normal)
    }
    
    func changesimages(){
        first.setImage(UIImage(named: "ladyimage"), forState: UIControlState.Normal)
        second.setImage(UIImage(named: "videoimage"), forState: UIControlState.Normal)
        third.setImage(UIImage(named: "historyimage"), forState: UIControlState.Normal)
        fourth.setImage(UIImage(named: "searchimage"), forState: UIControlState.Normal)
        fifth.setImage(UIImage(named: "carimage"), forState: UIControlState.Normal)
        
        
        
        
    
    }
    
//  internal func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
//    
//    
//    
//   // return CGSizeMake(100, 50)
//return CGSizeMake(view.frame.width, 100)
//    }
    
}

