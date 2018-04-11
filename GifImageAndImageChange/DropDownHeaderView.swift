//
//  DropDownHeaderView.swift
//  GifImageAndImageChange
//
//  Created by 张海峰 on 2018/4/11.
//  Copyright © 2018年 张海峰. All rights reserved.
//

import UIKit

class DropDownHeaderView: UIView {

    @IBOutlet weak var backGroundImgView: UIImageView!//背景图片
    class func newInstance() -> DropDownHeaderView? {
        let nibView = Bundle.main.loadNibNamed("DropDownHeaderView", owner: nil, options: nil)
        if let view = nibView?.first as? DropDownHeaderView {
            return view
        }
        return nil
    }

}
