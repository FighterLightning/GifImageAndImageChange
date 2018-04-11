//
//  DropDownVC.swift
//  GifImageAndImageChange
//
//  Created by 张海峰 on 2018/4/11.
//  Copyright © 2018年 张海峰. All rights reserved.
//

import UIKit

class DropDownVC: UIViewController {
    let iphoneX_Height :CGFloat = 812.0
    var tableView :UITableView!
     var headerView1: DropDownHeaderView = DropDownHeaderView.newInstance()!
    let MineCellIdentifier:String = "MineCellIdentifier"
    let HeaderHeight:CGFloat = 264 * ScreenHeight/667 + 85
    override func viewDidLoad() {
        super.viewDidLoad()

        addTableView()
    }
    func addTableView(){
        if (ScreenHeight == iphoneX_Height) {
            tableView = UITableView.init(frame: CGRect.init(x: 0, y: -45, width: ScreenWidth, height: ScreenHeight - 10), style: UITableViewStyle.grouped)
        }
        else{
            tableView = UITableView.init(frame: CGRect.init(x: 0, y: -20, width: ScreenWidth, height: ScreenHeight + 30), style: UITableViewStyle.grouped)
        }
        //0.将tableView放进控制器的View中
        self.view.addSubview(tableView)
        tableView.register(UINib.init(nibName: "MineCell", bundle: nil), forCellReuseIdentifier: MineCellIdentifier)
        tableView.backgroundColor = UIColor.white
        //分割线颜色
        tableView.separatorColor = UIColor.gray
        //分割线位置
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 25, bottom: 0, right: 0)
        //2. 设置代理
        tableView.delegate = self
        //3. 设置数据源
        tableView.dataSource = self
        tableView.addSubview(headerView1)
    }
}
extension DropDownVC :UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MineCell = tableView.dequeueReusableCell(withIdentifier:MineCellIdentifier) as! MineCell;
        cell.titleImg.image = UIImage.init(named: "image\(indexPath.row)")
        cell.nameLabel.text = "测试\(indexPath.row)"
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HeaderHeight
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yOffset: CGFloat = scrollView.contentOffset.y; // 偏移的y值，还要考虑导航栏的64哦
        if (yOffset < -20) {//向下拉是负值，向上是正
            let width :CGFloat  = ScreenWidth; // 图片宽度
            let totalOffset :CGFloat = HeaderHeight  - yOffset
            let f:  CGFloat  = totalOffset / HeaderHeight;//缩放比例
            //拉伸后的图片的frame应该是同比例缩放。
            headerView1.frame = CGRect.init(x: -(width * f - width)/2, y: yOffset + 20, width:  width * f, height: totalOffset)
            headerView1.backGroundImgView.frame = CGRect.init(x: -(width * f - width)/2, y: yOffset + 20, width: width * f, height: totalOffset - 105)
        }
        else{
            headerView1.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: HeaderHeight)
            headerView1.backGroundImgView.frame = CGRect.init(x: -10, y: -1, width: ScreenWidth + 20, height: HeaderHeight - 84)
        }
    }
}
