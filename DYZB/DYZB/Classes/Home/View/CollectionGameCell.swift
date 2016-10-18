//
//  CollectionGameCell.swift
//  DYZB
//
//  Created by 陈峰 on 16/10/18.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var group : AnchorGroup?{
        didSet{
            titleLabel.text = group?.tag_name
            let iconURL = NSURL(string: group?.icon_url ?? "")!
            
            iconImageView.kf_setImageWithURL(iconURL, placeholderImage: UIImage(named: "home_more_btn"))
        }
    }

}
