//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by 陈峰 on 16/10/14.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit

class RecommendViewModel: NSObject {

    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    lazy var cycleModels : [CycleModel] = [CycleModel]()
    private lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    private lazy var prettyGroup : AnchorGroup = AnchorGroup()
}

extension RecommendViewModel{
    //请求推荐数据
    func requestData(finishCallback : () -> ()) {
        
        //1、请求参数：
        let parameters = ["limit" : "4", "offset" : "0" , "time" : NSDate.getCurrenTime()]
        
        //2、创建Group组
        let disGroup = dispatch_group_create()
        
        //3、第一部分推荐数据
        dispatch_group_enter(disGroup)
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom",parameters: ["time" : NSDate.getCurrenTime()]) { (result) in
            //1、将result转成字典类型
            guard let resultDic = result as? [String : NSObject] else { return }
            //2、根据data 这key 获取 数组
            guard let dataArray = resultDic["data"] as? [[String : NSObject]] else { return }
            
            //3、遍历字典，并且转成模型对象
            
            //3.1、设置组的属性
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            //3.2、获取主播数据
            for dict in dataArray{
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            //3.3 离开组
            dispatch_group_leave(disGroup)
            
        }
        
        //4、第二部分颜值数据
        dispatch_group_enter(disGroup)
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom",parameters: parameters) { (result) in
            //1、将result转成字典类型
            guard let resultDic = result as? [String : NSObject] else { return }
            //2、根据data 这key 获取 数组
            guard let dataArray = resultDic["data"] as? [[String : NSObject]] else { return }
            
            //3、遍历字典，并且转成模型对象
            //3.1、设置组的属性
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            //3.2、获取主播数据
            for dict in dataArray{
                let anchor = AnchorModel(dict: dict)
                self.prettyGroup.anchors.append(anchor)
            }
            //3.3 离开组
            dispatch_group_leave(disGroup)
        }
        
        //5、第三部分 2-12组 其他部分数据   http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1476415054
        //        print(NSDate.getCurrenTime())
        dispatch_group_enter(disGroup)
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate",parameters: parameters) { (result) in

            //将result转成字典类型
            guard let resultDic = result as? [String : NSObject] else { return }
            //2、根据data 这key 获取 数组
            guard let dataArray = resultDic["data"] as? [[String : NSObject]] else { return }
            //3、遍历数组，字典转模型
            for dic in dataArray{
                let group = AnchorGroup(dict : dic)
                self.anchorGroups.append(group)
            }
            //4 离开组
            dispatch_group_leave(disGroup)
        }
        
        //6、所有数据请求成功后排序
        dispatch_group_notify(disGroup, dispatch_get_main_queue()) { 
            self.anchorGroups.insert(self.prettyGroup, atIndex: 0)
            self.anchorGroups.insert(self.bigDataGroup, atIndex: 0)
            finishCallback()
        }
    }
    
    //请求无线轮播的数据
    func requestCycleData(finishCallback : () -> ()) {
        NetworkTools.requestData(.get, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version" : "2.300"]) { (result) in
            //1、将result转成字典类型
            guard let resultDic = result as? [String : NSObject] else { return }
            //2、根据data 这key 获取 数组
            guard let dataArray = resultDic["data"] as? [[String : NSObject]] else { return }
            //3、遍历数组，字典转模型
            for dic in dataArray{
                self.cycleModels.append(CycleModel(dict: dic))
            }
         finishCallback()
        }
    }
    
    
}

