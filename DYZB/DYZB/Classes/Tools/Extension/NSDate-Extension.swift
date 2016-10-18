//
//  NSDate-Extension.swift
//  DYZB
//
//  Created by 陈峰 on 16/10/14.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import Foundation

extension NSDate{
    //获取当前时间
    class func getCurrenTime() -> String{
        let nowDate = NSDate()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
        
        
    }
}
