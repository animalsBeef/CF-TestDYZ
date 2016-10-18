//
//  RecommendGameView.swift
//  DYZB
//
//  Created by 陈峰 on 16/10/18.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"
private let kEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var groups : [AnchorGroup]?{
        didSet{
            //先移除前两组 热门、颜值
            groups?.removeFirst()
            groups?.removeFirst()
            
            //添加更多到数组里
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = .None
        
        collectionView.registerNib(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }
    
}

extension RecommendGameView{
    class func recommendGameView() -> RecommendGameView {
        return NSBundle.mainBundle().loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

extension RecommendGameView : UICollectionViewDataSource{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return groups?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier(kGameCellID, forIndexPath: indexPath) as! CollectionGameCell
        
        cell.group = groups![indexPath.item]
        
        return cell
    }
}
