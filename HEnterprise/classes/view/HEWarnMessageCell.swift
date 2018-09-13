//
//  HEWarnMessageCell.swift
//  HEnterprise
//
//  Created by apple on 2018/8/28.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

class HEWarnMessageCell: UITableViewCell {

    @IBOutlet weak var lab_zhi_value: UILabel!
    @IBOutlet weak var lab_value: UILabel!
    @IBOutlet weak var lab_wrw_name: UILabel!
    @IBOutlet weak var iv_pk: UIImageView!
    @IBOutlet weak var lab_pk_name: UILabel!
    @IBOutlet weak var lab_warn_time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
