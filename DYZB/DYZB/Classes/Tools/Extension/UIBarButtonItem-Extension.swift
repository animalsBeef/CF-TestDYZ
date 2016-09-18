//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by 陈峰 on 16/9/18.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    class func createItem(imageName : String, highImageName : String, size: CGSize) -> UIBarButtonItem {
    
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: highImageName), forState: .Highlighted)
        btn.frame = CGRect(origin: CGPointZero, size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    
    convenience init(imageName : String, highImageName : String = "" , size: CGSize = CGSizeZero){
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        
        if highImageName != ""{
            btn.setImage(UIImage(named: highImageName), forState: .Highlighted)
        }
        
        if size == CGSizeZero{
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPointZero, size: size)
        }
        
        self.init(customView : btn)
    }
    
}