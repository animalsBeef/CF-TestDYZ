//
//  AnchorModel.swift
//  DYZB
//
//  Created by 陈峰 on 16/10/14.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {

    var room_id : Int = 0
    var vertical_src : String = ""
    var isVertical : Int = 0
    var room_name : String = ""
    var nickname : String = ""
    var online : Int = 0
    var anchor_city : String = ""
    
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
}
