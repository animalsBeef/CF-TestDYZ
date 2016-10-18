//
//  RecommendCycleView.swift
//  DYZB
//
//  Created by 陈峰 on 16/10/17.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class RecommendCycleView: UIView {

    //MARK - 定义属性
    var cycleTimer : NSTimer?
    
    var cycleModels :[CycleModel]?{
        didSet{
            //1、刷新collectionView
            collectionView.reloadData()
            //2、设置pageControl个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            //3、默认滚动到中间的一个位置
            let indexPath = NSIndexPath(forItem: (cycleModels?.count ?? 0) * 100, inSection: 0)
            collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
            //4、添加定时器
            removeCycleTimer()
            addCycleTimer()
            
        }
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = .None
        
        collectionView.registerNib(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 设置collectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

// MARK:- 提供一个快速创建RecommendCycleView的类方法
extension RecommendCycleView {
    class func recommendCycleView() -> RecommendCycleView {
        return NSBundle.mainBundle().loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}

// MARK - 遵循UICollectionView的数据源协议
extension RecommendCycleView : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * 10000
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCellWithReuseIdentifier(kCycleCellID, forIndexPath: indexPath) as! CollectionCycleCell
        cell.cycleModel = cycleModels![indexPath.item % cycleModels!.count]
        
        return cell
    }
}
// MARK - 遵循UICollectionView的代理协议
extension RecommendCycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //1、获取滚动的偏移量
//        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        let offsetX = scrollView.contentOffset.x
        
        //2、计算pageControl的 currentIndex
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        removeCycleTimer()
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}
// MARK: -对定时器的操作方法
extension RecommendCycleView{
    private func addCycleTimer(){
        cycleTimer = NSTimer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(cycleTimer!, forMode: NSRunLoopCommonModes)
    }
    private func removeCycleTimer() {
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    @objc private func scrollToNext() {
        //1、获取滚动的偏移量
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        
        //2、滚动该位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
    }
}
