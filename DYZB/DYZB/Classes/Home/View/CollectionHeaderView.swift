//
//  CollectionHeaderView.swift
//  DYZB
//
//  Created by 1 on 16/9/18.
//  Copyright © 2016年 superBee. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var group : AnchorGroup? {
        didSet{
            titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
    
}
