//
//  HEAddressBookCell.swift
//  HEnterprise
//
//  Created by apple on 2018/8/29.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

class HEAddressBookCell: UITableViewCell {

    @IBOutlet weak var iv_contact_header: UIImageView!
    
    @IBOutlet weak var lab_contact_name: UILabel!
    
    @IBOutlet weak var lab_contact_phone: UILabel!
    
    @IBOutlet weak var iv_call_phone: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
