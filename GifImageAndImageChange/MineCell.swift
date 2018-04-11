//
//  MineCell.swift
//  AmazedBox
//
//  Created by 张海峰 on 2017/12/26.
//  Copyright © 2017年 张海峰. All rights reserved.
//

import UIKit

class MineCell: UITableViewCell {
    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
