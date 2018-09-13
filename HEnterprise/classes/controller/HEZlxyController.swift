//
//  HEZlxyController.swift
//  HEnterprise
//
//  Created by apple on 2018/9/4.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

class HEZlxyController: HEBaseController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let cellId = "cellId"
    var page = 1
    var items:[String] = ["条目1","条目2","条目3","条目4","条目5","条目7","条目7"]
    
    //所有因子
    var yinZis:Dictionary<Int, [String]>!
    
    //分组头标题
    var articleHeaders:[String]!
    
    //存储选中单元格的索引
    var selectedIndexs = [Int]()
    
    //设置tableview headview 开始
    lazy var headView = UIView()
    lazy var viewTitle = UIView()
    lazy var viewValue = UIView()
    lazy var labTitle = UILabel()
    lazy var labTitle1 = UILabel()
    lazy var labTitle2 = UILabel()
    lazy var labTitle3 = UILabel()
    lazy var labTitle4 = UILabel()
    lazy var labValue1 = UILabel()
    lazy var labValue2 = UILabel()
    lazy var labValue3 = UILabel()
    lazy var labValue4 = UILabel()
    //设置tableview headview 结束
    
    override func setupUI() {
        super.setupUI()
    
        //初始化数据
        self.yinZis =  [
            0:[String]([
                "1、SO2",
                "2、SO2",
                "3、SO2",
                "4、SO2",
                "5、SO2",
                "6、SO2",
                "7、SO2",
                ]),
            1:[String]([
                "1、CO2",
                "2、CO2",
                "3、CO2",
                "4、CO2",
                "5、v",
                "6、SO2",
                "7、SO2",])
        ]
        
        self.articleHeaders = ["   1#焦炉烟筒出口","    2#焦炉烟筒出口"]
        
        segmented.addTarget(self, action: #selector(segmentDidchange(_:)),
                            for: .valueChanged)
        
        setupTableView()
        
        
    }
    
    //状态改变之后的执行方法
    @objc func segmentDidchange(_ sender: UISegmentedControl){
        //获得选项的索引
        print(segmented.selectedSegmentIndex)
        switch segmented.selectedSegmentIndex {
        case 0:
            headView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 10)
            tableView.tableHeaderView = headView
            tableView.tableHeaderView?.isHidden = true
            
            break
        default:
            setupTableHeader()
            tableView.tableHeaderView?.isHidden = false
            break
        }
        //获得选择的文字
        print(segmented.titleForSegment(at: segmented.selectedSegmentIndex) ?? "aa")
    }
    
    func setupTableHeader(){
        
        headView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 132)
        
        viewTitle.addSubview(labTitle1)
        viewTitle.addSubview(labTitle2)
        viewTitle.addSubview(labTitle3)
        viewTitle.addSubview(labTitle4)
        
        viewValue.addSubview(labValue1)
        viewValue.addSubview(labValue2)
        viewValue.addSubview(labValue3)
        viewValue.addSubview(labValue4)
        
        headView.addSubview(labTitle)
        headView.addSubview(viewTitle)
        headView.addSubview(viewValue)
        
        
        viewTitle.backgroundColor = YMGlobalTheme()

        
        labTitle.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth)
            make.height.equalTo(44)
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(10)
        }
        
        viewTitle.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth)
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(0)
            make.top.equalTo(labTitle.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
        }
        
        viewValue.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth)
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(0)
            make.top.equalTo(viewTitle.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
        }
        
        //设置title的布局
        labTitle1.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth/4)
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(0)
        }
        labTitle2.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth/4)
            make.height.equalTo(44)
            make.left.equalTo(labTitle1.snp.right).offset(0)
            make.top.equalToSuperview().offset(0)
        }
        labTitle3.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth/4)
            make.height.equalTo(44)
            make.left.equalTo(labTitle2.snp.right).offset(0)
            make.top.equalToSuperview().offset(0)
        }
        labTitle4.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth/4)
            make.height.equalTo(44)
            make.left.equalTo(labTitle3.snp.right).offset(0)
            make.top.equalToSuperview().offset(0)
        }
        
        //设置value的布局
        labValue1.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth/4)
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(0)
        }
        labValue2.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth/4)
            make.height.equalTo(44)
            make.left.equalTo(labValue1.snp.right).offset(0)
            make.top.equalToSuperview().offset(0)
        }
        labValue3.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth/4)
            make.height.equalTo(44)
            make.left.equalTo(labValue2.snp.right).offset(0)
            make.top.equalToSuperview().offset(0)
        }
        labValue4.snp.makeConstraints { (make) in
            make.width.equalTo(screenWidth/4)
            make.height.equalTo(44)
            make.left.equalTo(labValue3.snp.right).offset(0)
            make.top.equalToSuperview().offset(0)
        }
        
        labTitle.text = "工况参数"
        labTitle1.text = "烟温"
        labTitle2.text = "烟气流量"
        labTitle3.text = "PH值"
        labTitle4.text = "压力"
        
        labTitle1.textColor = UIColor.white
        labTitle2.textColor = UIColor.white
        labTitle3.textColor = UIColor.white
        labTitle4.textColor = UIColor.white
        labTitle1.textAlignment = .center
        labTitle2.textAlignment = .center
        labTitle3.textAlignment = .center
        labTitle4.textAlignment = .center
        labTitle1.font = UIFont.systemFont(ofSize: 14)
        labTitle2.font = UIFont.systemFont(ofSize: 14)
        labTitle3.font = UIFont.systemFont(ofSize: 14)
        labTitle4.font = UIFont.systemFont(ofSize: 14)
        
        
        labValue1.text = "50·C"
        labValue2.text = "100"
        labValue3.text = "7.2"
        labValue4.text = "10.6"
        
        labValue1.textColor = UIColor.darkGray
        labValue2.textColor = UIColor.darkGray
        labValue3.textColor = UIColor.darkGray
        labValue4.textColor = UIColor.darkGray
        labValue1.textAlignment = .center
        labValue2.textAlignment = .center
        labValue3.textAlignment = .center
        labValue4.textAlignment = .center
        labValue1.font = UIFont.systemFont(ofSize: 14)
        labValue2.font = UIFont.systemFont(ofSize: 14)
        labValue3.font = UIFont.systemFont(ofSize: 14)
        labValue4.font = UIFont.systemFont(ofSize: 14)
        
        tableView.tableHeaderView = headView
        
        tableView.tableHeaderView?.isHidden = true
    }
    
    //初始化tableView
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        // 注册原型 cell
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.register(UINib(nibName: "HEGkzlCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //设置允许单元格多选
//        self.tableView!.allowsMultipleSelection = true
        refresh()
        
    }
    
    override func loadData() {
        super.loadData()
        
       
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
    
    //只有一个分区
    //有2个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleHeaders.count
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.yinZis[section]
        return data!.count
    }
   
    // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的头部
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)
        -> String? {
           return self.articleHeaders[section]
    }
    // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的尾部
//    func tableView(_ tableView:UITableView, titleForFooterInSection section:Int)->String? {
//        let data = self.yinZis[section]
//        return "有\(data!.count)条数据"
//     }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HEGkzlCell
        if indexPath.row == 0 {
            cell?.backgroundColor = UIColor.cz_color(withRed: 84, green: 176, blue: 180)
            cell?.lab_wrw_name.text = "污染物"
            cell?.lab_wrw_value.text = "浓度mg/m3"
            cell?.lab_wrw_status.text = "状态"
            cell?.lab_zhi_value.text = "指标"
            
            cell?.lab_wrw_name.textColor = UIColor.white
            cell?.lab_wrw_value.textColor = UIColor.white
            cell?.lab_wrw_status.textColor = UIColor.white
            cell?.lab_zhi_value.textColor = UIColor.white
            
        }else{
            cell?.backgroundColor = UIColor.white
            cell?.lab_wrw_name.text = "SO2"
            cell?.lab_wrw_status.text = "正常"
        }
        
        //判断是否选中（选中单元格尾部打勾）
        if selectedIndexs.contains(indexPath.row) {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        return cell!
    }
    
    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //判断该行原先是否选中
        if indexPath.row != 0 {
            if let index = selectedIndexs.index(of: indexPath.row){
                selectedIndexs.remove(at: index) //原来选中的取消选中
            }else{
                selectedIndexs.append(indexPath.row) //原来没选中的就选中
            }
        }
        ////刷新该行
        self.tableView?.reloadRows(at: [indexPath], with: .automatic)
        
//        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //处理列表项的取消选中事件
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = self.tableView?.cellForRow(at: indexPath)
//        cell?.accessoryType = .none
//    }
    
    //设置分组尾的高度
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 20
//    }
    
    //将分组尾设置为一个空的View
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return UIView()
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    
    func onClickSure(){
        print("选中项的索引为：", selectedIndexs)
        print("选中项的值为：")
        for index in selectedIndexs {
            print(items[index])
        }
    }

}

