//
//  HEGkzlCell.swift
//  HEnterprise
//
//  Created by apple on 2018/9/4.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

class HEGkzlCell: UITableViewCell {

    @IBOutlet weak var lab_wrw_name: UILabel!
    
    @IBOutlet weak var lab_wrw_value: UILabel!
    
    @IBOutlet weak var lab_wrw_status: UILabel!
    
    @IBOutlet weak var lab_zhi_value: UILabel!
    
    @IBOutlet weak var img_scause: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
