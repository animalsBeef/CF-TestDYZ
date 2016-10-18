//
//  CollectionNormalCell.swift
//  DYZB
//
//  Created by 1 on 16/9/18.
//  Copyright © 2016年 superBee. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {

    //mark - 控件属性
    @IBOutlet weak var roomNameLabel: UILabel!

    //mark - 定义模型属性
    override var anchor : AnchorModel? {
        didSet{
            // 1、赋值给父类
            super.anchor = anchor
            // 2、所在房间名称
            roomNameLabel.text = anchor?.room_name
        }
    }

    
}
