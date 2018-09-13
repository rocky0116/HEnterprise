//
//  HEIdeaController.swift
//  HEnterprise
//
//  Created by apple on 2018/8/24.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit
import SwiftProgressHUD

class HEIdeaController: HEBaseController {

    @IBOutlet weak var add_imageView: UIImageView!
    @IBOutlet weak var txt_phone: UITextField!
    @IBOutlet weak var txt_content: UITextField!
    @IBOutlet weak var bar_back: UIBarButtonItem!
    
    @IBOutlet weak var btn_commit: UIButton!
    
    override func setupUI() {
        super.setupUI()
        
        self.view.backgroundColor = UIColor.cz_color(withRed: 242, green: 242, blue: 242)
    }
    
    override func loadData() {
        super.loadData()
    }
    
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClickHistory(_ sender: Any) {
    }
    @IBAction func onClickCommit(_ sender: Any) {
        SwiftProgressHUD.showSuccess("提交成功")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            SwiftProgressHUD.hideAllHUD()
            self.dismiss(animated: true, completion: nil)
        }
    }
    

}
