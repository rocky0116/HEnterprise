//
//  HEMyCell.swift
//  HEnterprise
//
//  Created by apple on 2018/8/22.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

class HEMyCell: UITableViewCell {

    @IBOutlet weak var iconImgView: UIImageView!
    
    @IBOutlet weak var titleLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
