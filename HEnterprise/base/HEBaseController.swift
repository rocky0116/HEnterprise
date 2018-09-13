//
//  HEBaseController.swift
//  HEnterprise
//
//  Created by apple on 2018/8/22.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit
import MJRefresh
import SnapKit

class HEBaseController: UIViewController {
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }

    //MARK: 加载数据 - 具体的实现由子类负责
    @objc func loadData() {
        // 如果子类不实现任何方法，默认关闭刷新控件
        
    }
    
    //MARK: 设置布局
    func setupUI() {
        view.backgroundColor = UIColor.white
        
    }

}
