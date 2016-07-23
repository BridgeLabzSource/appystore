//
//  controller.swift
//  AppyStoreProject
//
//  Created by BridgeLabz on 19/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class controller: Controllerprotocol {

    
    var datalist = NSMutableArray()
    var variableprotocol : ViewProtocol!
    var mRestServiceObj : RestService! 
    
    init(viewprotocolobject : ViewProtocol) {
        variableprotocol = viewprotocolobject
        
        mRestServiceObj = RestService()
        mRestServiceObj.mGetCategoryList(self)
        
//        alamofireobject = AalmofireRequest()
//        alamofireobject.almofirerequest(self)
        
        
    }
    
    
    func update(list : AnyObject!){
        
       datalist = list as! NSMutableArray
        variableprotocol.updateview()
        
    }
    
    
    
}
