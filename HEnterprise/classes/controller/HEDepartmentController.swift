//
//  HEDepartmentController.swift
//  HEnterprise
//
//  Created by apple on 2018/8/29.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

class HEDepartmentController: HEBaseController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellId = "cellId"
    var departs = ["技术部","信息科","财务部","总经办","后勤部","掘金","简书"]
    
    override func setupUI() {
        super.setupUI()
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
        tableView.register(UINib(nibName: "HEDepartmentCell", bundle: nil), forCellReuseIdentifier: cellId)
        refresh()
    }
    
    //添加刷新
    func refresh(){
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        //添加下拉刷新
        tableView.mj_header = header
        footer.isHidden = true
    }
    
    //下拉刷新
    @objc func headerRefresh(){
        //结束头部刷新
        tableView.mj_header.endRefreshing()
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HEDepartmentCell
        
        cell?.lab_department_name.text = departs[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "addressBookSegue", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
