//
//  CustomViewFlowLayout.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 26/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class CustomViewFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
    }
    
    init(width : CGFloat) {
        super.init()
        setUpLayout(width)
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayout (w : CGFloat) {
        minimumInteritemSpacing = 20
        minimumLineSpacing = 30
        itemSize = CGSize(width: (w)/5, height: 120)
        sectionInset = UIEdgeInsetsMake(10,10,10,10)
        scrollDirection = .Vertical
    }

}
