//
//  MainViewController.swift
//  DYZB
//
//  Created by 陈峰 on 16/9/18.
//  Copyright © 2016年 陈峰. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVC("Home")
        addChildVC("Live")
        addChildVC("Follow")
        addChildVC("Profile")
    }
    
    private func addChildVC(storyName : String){
        
        let childVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVC)
    }
    
}
