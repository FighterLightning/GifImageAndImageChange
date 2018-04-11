//
//  OpenBoxView.swift
//  GifImageAndImageChange
//
//  Created by 张海峰 on 2018/4/11.
//  Copyright © 2018年 张海峰. All rights reserved.
//

import UIKit

class OpenBoxView: PopBackGroundView {
 let titleHeight: CGFloat = 75
    override func addAnimate() {
        self.isHidden = false
        UIView.animate(withDuration:0.5, animations: {
            self.WhiteView.frame = CGRect.init(x: 40, y: 100, width: ScreenWidth - 80, height: ScreenHeight - 230)
        }) { (_) in
            self.cancelBtn.frame.origin.y = self.WhiteView.frame.maxY +  20
            self.cancelBtn.isHidden = false
            self.addWhiteViewSubView()
        }
    }
    func addWhiteViewSubView(){
        let shadowpath :UIBezierPath = UIBezierPath.init(rect: self.WhiteView.bounds)
        self.WhiteView.layer.shadowColor = UIColor.yellow.cgColor
        self.WhiteView.layer.shadowOffset = CGSize.init(width:0, height: 1)//设置阴影的偏移量
        self.WhiteView.layer.shadowOpacity = 1 //设置阴影的透明度
        self.WhiteView.layer.shadowPath = shadowpath.cgPath
        self.WhiteView.layer.shadowRadius = 22
        self.WhiteView.layer.masksToBounds = false
        let titleLabel: UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.WhiteView.frame.width, height: titleHeight))
        titleLabel.text = "恭喜你拆出下列产品"
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = UIColor.gray
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.WhiteView.addSubview(titleLabel)
        let imageView: UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: titleHeight, width: self.WhiteView.frame.width, height: self.WhiteView.frame.height - titleHeight))
        imageView.image = UIImage.init(named: "test")
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        self.WhiteView.addSubview(imageView)
    }
    override func tapBtnAndcancelBtnClick() {
        self.superview?.removeFromSuperview()
    }

}
