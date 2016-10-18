//
//  CollectionPrettyCell.swift
//  DYZB
//
//  Created by 1 on 16/9/18.
//  Copyright © 2016年 superBee. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: CollectionBaseCell {

    //mark - 控件属性
    @IBOutlet weak var cityBtn: UIButton!
    
    //mark - 定义模型属性
    override var anchor : AnchorModel? {
        didSet{
            super.anchor = anchor
            // 3、所在城市
            cityBtn.setTitle(anchor?.anchor_city, forState: .Normal)
        }
    }
}
