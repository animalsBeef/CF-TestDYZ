//
//  AnchorGroup.swift
//  DYZB
//
//  Created by 陈峰 on 16/10/14.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject {

    var room_list : [[String : NSObject]]? {
        didSet {
            guard let room_list = room_list else { return  }
            for dict in room_list {
                anchors.append(AnchorModel( dict : dict))
            }
        }
    }
    
    var tag_name : String = ""
    
    var icon_name : String = "home_header_normal"
    
    var icon_url : String = ""
    
    
    var anchors : [AnchorModel] = [AnchorModel]()
    
    override init() {
        
    }
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    /*
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "romm_list"  {
            if let dataArray = value as? [[String : NSObject]]{
                for dict in dataArray{
                    anchors.append(AnchorModel(dict:dict))
                }
            }
        }
    }
     */
}
