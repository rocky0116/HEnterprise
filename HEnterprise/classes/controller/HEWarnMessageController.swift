//
//  HEWarnMessageController.swift
//  HEnterprise
//
//  Created by apple on 2018/8/24.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

class HEWarnMessageController: HEBaseController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellId = "cellId"
    var page = 1
    
    override func setupUI() {
        super.setupUI()
        
        self.view.backgroundColor = UIColor.cz_color(withRed: 242, green: 242, blue: 242)
        
        setupTableView()
    }
    
    override func loadData() {
        super.loadData()
    }
    
    //初始化tableView
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        // 注册原型 cell
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.register(UINib(nibName: "HEWarnMessageCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        refresh()
        
    }
    
    //添加刷新
    func refresh(){
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        
        // 上拉刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        
        self.tableView.mj_header = header
        self.tableView.mj_footer = footer
    }
    
    //下拉刷新
    @objc func headerRefresh(){
        //结束头部刷新
        self.tableView.mj_header.endRefreshing()
        page = 1
        print(page)
        loadData()
    }
    
    @objc func footerRefresh(){
        //结束尾部刷新
        self.tableView.mj_footer.endRefreshing()
        page = page + 1
        print(page)
        loadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HEWarnMessageCell
        
        cell?.lab_pk_name.text = "1#焦炉烟筒出口"
        
        cell?.lab_wrw_name.text = "SO2、NOx"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
