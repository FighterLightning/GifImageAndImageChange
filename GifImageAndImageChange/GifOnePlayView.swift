//
//  GifOnePlayView.swift
//  GifImageAndImageChange
//
//  Created by 张海峰 on 2018/4/11.
//  Copyright © 2018年 张海峰. All rights reserved.
//

import UIKit

class GifOnePlayView: UIView {
    var backGroundImageView :UIImageView =  UIImageView()
    lazy var images : NSMutableArray = NSMutableArray()
    //初始化视图
    func initGifOnePlayView() -> UIView {
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha:0)
        self.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        let fileUrl :NSURL = Bundle.main.url(forResource:  "GifImageA", withExtension: "gif")! as NSURL //加载GIF图片
        let gifSource : CGImageSource =  CGImageSourceCreateWithURL(fileUrl, nil)!  //将GIF图片转换成对应的图片源
        let frameCout : NSInteger = CGImageSourceGetCount(gifSource)//获取其中图片源个数，即由多少帧图片组成
        self.images = NSMutableArray.init()//定义数组存储拆分出来的图片
        for i in 0 ..< frameCout{
            let imageRef :CGImage = CGImageSourceCreateImageAtIndex(gifSource, i, nil)!//从GIF图片中取出源图片
            let image : UIImage = UIImage.init(cgImage: imageRef)
            self.images.add(image)
        }
        backGroundImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        backGroundImageView.image = self.images.firstObject as? UIImage
        backGroundImageView.isUserInteractionEnabled = true
        backGroundImageView.contentMode = UIViewContentMode.scaleAspectFill
        let AnimationNtimer : NSInteger = 5 //动画持续时间
        backGroundImageView.animationImages = self.images as? [UIImage]//将图片数组加入UIImageView动画数组中
        backGroundImageView.isUserInteractionEnabled = true
        backGroundImageView.contentMode = UIViewContentMode.scaleAspectFill
        backGroundImageView.animationRepeatCount = 1 //只播放一次
        backGroundImageView.animationDuration = TimeInterval(AnimationNtimer); //每次动画时长
        backGroundImageView.startAnimating()
        //播放结束停在最后一帧动画
        Timer.scheduledTimer(timeInterval: TimeInterval(AnimationNtimer), target: self, selector: #selector(self.ArrowAnimationPlay), userInfo: nil, repeats: false)
        self.addSubview(backGroundImageView)
        // 添加一个取消按钮
        let cancelBtn:UIButton = UIButton.init(type: UIButtonType.custom)
        cancelBtn.frame = CGRect.init(x:30, y: 30, width: 60, height: 30)
        cancelBtn.setTitle("取消", for: UIControlState.normal)
        cancelBtn.backgroundColor = UIColor.gray
        cancelBtn.titleLabel?.textColor = UIColor.white
        cancelBtn.addTarget(self, action: #selector(tapBtnAndcancelBtnClick), for: UIControlEvents.touchUpInside)
        self.addSubview(cancelBtn)
        return self
    }
    @objc func ArrowAnimationPlay(){
        backGroundImageView.image = self.images.lastObject as? UIImage
    }
     @objc func tapBtnAndcancelBtnClick() {
        self.removeFromSuperview()
    }
}
