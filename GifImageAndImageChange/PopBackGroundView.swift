//
//  PopBackGroundVIew.swift
//  AmazedBox
//
//  Created by 张海峰 on 2018/1/9.
//  Copyright © 2018年 张海峰. All rights reserved.
//

import UIKit

class PopBackGroundView: UIView,UIGestureRecognizerDelegate {
     var WhiteView: UIView =  UIView()
     var cancelBtn: UIButton = UIButton()
     var backgroundColor1:UIColor  = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
    //初始化视图
    func initPopBackGroundView() -> UIView {
        self.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        self.backgroundColor = backgroundColor1
        self.isHidden = true
        //设置添加地址的View
        self.WhiteView.frame = CGRect.init(x: ScreenWidth/2 - 10, y: ScreenHeight/2 - 10, width: 20, height: 20)
        WhiteView.backgroundColor = UIColor.white
        WhiteView.layer.masksToBounds = true
        WhiteView.layer.cornerRadius = 10
         self.addSubview(WhiteView)
        cancelBtn = UIButton.init(type: UIButtonType.custom)
        cancelBtn.frame = CGRect.init(x:ScreenWidth/2 - 20, y: WhiteView.frame.maxY + 20, width: 40, height: 40)
        cancelBtn.tag = 1
        cancelBtn.setImage(UIImage.init(named: "cancel_white"), for: UIControlState.normal)
        cancelBtn.isHidden = true
        cancelBtn.addTarget(self, action: #selector(tapBtnAndcancelBtnClick), for: UIControlEvents.touchUpInside)
        self.addSubview(cancelBtn)
        return self
    }
    //弹出的动画效果
    func addAnimate() {

    }
    //收回的动画效果
    @objc func tapBtnAndcancelBtnClick() {
        UIView.animate(withDuration: 0.2, animations: {
            self.cancelBtn.isHidden = true
            self.WhiteView.frame = CGRect.init(x: ScreenWidth/2 - 20, y: ScreenHeight/2 - 20, width: 40, height: 40)
            self.cancelBtn.frame.origin.y = self.WhiteView.frame.maxY + 20
        }) { (_) in
            self.isHidden = true
            for view in  self.WhiteView.subviews{
                view.removeFromSuperview()
            }
        }
       
    }
}
