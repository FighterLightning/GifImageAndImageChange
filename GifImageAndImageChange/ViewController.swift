//
//  ViewController.swift
//  GifImageAndImageChange
//
//  Created by 张海峰 on 2018/4/11.
//  Copyright © 2018年 张海峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //GIF的单次播放
     var gifOnePlayView : GifOnePlayView!
    //拆开一个盒子的动画效果
    var popAwayOpenView : PopAwayOpenBackGroundView! //gif背景图
    var openBoxView : OpenBoxView! //盒子打开动画效果图
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //GIF的单次播放
    @IBAction func gifBtnClick(_ sender: UIButton) {
          self.gifOnePlayView = GifOnePlayView()
          self.view.addSubview(self.gifOnePlayView.initGifOnePlayView())
    }
    //拆开一个盒子的动画效果
    @IBAction func openBoxBtnClick(_ sender: Any) {
        //播放gif图
        self.popAwayOpenView = PopAwayOpenBackGroundView()
    UIApplication.shared.keyWindow?.addSubview(self.popAwayOpenView.initPopAwayOpenBackGroundView())
        self.popAwayOpenView.addAnimate()
        //当播放GIF图一半时，弹出加载的产品图   1.5 为GIF播放一半所用的时间
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (_) in
                self.popGood()
            })
        } else {
            sleep(UInt32(1.5))
            self.popGood()
        }
    }
    //弹出加载的产品图
    @objc func popGood(){
        self.openBoxView = OpenBoxView()
        self.openBoxView.backgroundColor1 = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        self.popAwayOpenView.addSubview(self.openBoxView.initPopBackGroundView())
        self.openBoxView.addAnimate()
    }
    //tableView下拉header图片放大效果
    @IBAction func dropDownBtnClick(_ sender: Any) {
        let dropDownVC: DropDownVC = DropDownVC()
       self.present(dropDownVC, animated: true, completion: nil)
    }
}

