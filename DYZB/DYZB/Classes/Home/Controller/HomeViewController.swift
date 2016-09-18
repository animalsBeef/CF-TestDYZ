//
//  HomeViewController.swift
//  DYZB
//
//  Created by 陈峰 on 16/9/18.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI界面
        setupUI()
        
    }

}

// Mark: - 设置UI界面

extension HomeViewController{
    
    private func setupUI(){
        //设置导航栏
        setupNavigationBar();
        
        
    }
    
    private func setupNavigationBar(){
        //设置左侧Item
        let btn = UIButton()
        btn.setImage(UIImage(named: "logo"), forState:.Normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        
        //设置右侧Item
        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
    
}