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
    var alamofireobject : AalmofireRequest!
    var variableprotocol : ViewProtocol!
    
    init(viewprotocolobject : ViewProtocol) {
        variableprotocol = viewprotocolobject
        alamofireobject = AalmofireRequest()
        alamofireobject.almofirerequest(self)
        
        
    }
    
    
    func update(list : AnyObject!){
        
       datalist = list as! NSMutableArray
        variableprotocol.updateview()
        
    }
    
    
    
}
