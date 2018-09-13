//
//  HEMyController.swift
//  HEnterprise
//
//  Created by apple on 2018/8/22.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit
import SwiftProgressHUD

class HEMyController: HEBaseController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var userNameLab: UILabel!
    @IBOutlet weak var userHeaderImgView: UIImageView!
    @IBOutlet weak var userPartLab: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let cellId = "cellId"
    var names = ["供求广场","技术论坛","预警消息","我的消息","我的收藏","意见反馈","关于我们"]
    var images = ["gongxu","luntan","warn_message","laba","fav","idea","about"]
    
    override func setupUI() {
        super.setupUI()
        print("个人中心")
        setupTableView()
    }
    
    //初始化tableView
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        // 注册原型 cell
        tableView.register(UINib(nibName: "HEMyCell", bundle: nil), forCellReuseIdentifier: cellId)
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
    
    @IBAction func onClickSetting(_ sender: Any) {
        print("点击了设置按钮")
    }
    
    @IBAction func onClickMessage(_ sender: Any) {
         print("点击了消息按钮")
        self.performSegue(withIdentifier: "myMessageSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HEMyCell
        
        cell?.iconImgView.image = UIImage(named: images[indexPath.row])
        cell?.titleLab.text = names[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0: break
        
        case 1: break
        case 2:
            self.performSegue(withIdentifier: "warnMessageSegue", sender: self)
            break
        case 3:
            self.performSegue(withIdentifier: "myMessageSegue", sender: self)
            break
        case 4:
            self.performSegue(withIdentifier: "myFavSegue", sender: self)
            break
        case 5:
            self.performSegue(withIdentifier: "ideaSegue", sender: self)
            break
        case 6:
            self.performSegue(withIdentifier: "aboutSegue", sender: self)
            break
        
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let setPwdCtl = segue.destination as? RegisterViewCtl {
//            if segue.identifier == "registerSegue" {
//                setPwdCtl.viewType = .Register
//            } else {
//                setPwdCtl.viewType = .ResetPwd
//            }
//        } else if let msgBoxCtl = segue.destination as? MsgBoxViewCtl {
//            msgBoxCtl.messsage = self.curMsg
//        }
//    }

}
