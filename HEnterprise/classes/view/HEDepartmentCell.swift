//
//  HEDepartmentCell.swift
//  HEnterprise
//
//  Created by apple on 2018/8/29.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

class HEDepartmentCell: UITableViewCell {

    @IBOutlet weak var iv_department_header: UIImageView!
    
    @IBOutlet weak var lab_department_name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
