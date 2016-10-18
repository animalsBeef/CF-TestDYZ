//
//  CollectionBaseCell.swift
//  DYZB
//
//  Created by 陈峰 on 16/10/17.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    //mark - 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var onlineBtn: UIButton!
    //mark - 定义模型属性
    var anchor : AnchorModel? {
        didSet{
            // 1、显示在线人数
            guard let anchor = anchor else { return }
            var onlineStr : String = ""
            if anchor.online > 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            }else{
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, forState: .Normal)
            
            // 2、显示昵称
            nickNameLabel.text = anchor.nickname
            
            // 3、设置封面图片
            guard let iconURL = NSURL(string: anchor.vertical_src) else { return }
            iconImageView.kf_setImageWithURL(iconURL)

        }
    }
}
