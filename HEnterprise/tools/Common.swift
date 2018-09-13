//
//  Common.swift
//  HEnterprise
//
//  Created by apple on 2018/9/4.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

/// 屏幕的宽度
let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高度
let screenHeight = UIScreen.main.bounds.height

//用户名
let userName = "username"
//token
let token = "token"
//区域名称
let city = "city"
//区域编号
let areaCode = "areacode"

//版本
let versionCode = "2.0v"
// 服务器地址
let BASE_URL = "http://39.104.83.17:8081/app/"


/// 每页显示的数量
let pageSize = "10"


/// RGBA的颜色设置
func YMColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
/// 背景灰色
func YMGlobalColor() -> UIColor {
    return YMColor(r: 240, g: 240, b: 240, a: 1)
}

/// 红色
func YMGlobalRedColor() -> UIColor {
    return YMColor(r: 245, g: 80, b: 83, a: 1.0)
}

/// 主题色 浅蓝色
func YMGlobalTheme() -> UIColor {
    return YMColor(r: 84, g: 176, b: 180, a: 1.0)
}

/// 折线图的颜色
func YLineColor() -> UIColor {
    return YMColor(r: 241, g: 159, b: 103, a: 1.0)
}
/// 折线图的圆点的内色
func YLineYNColor() -> UIColor {
    return YMColor(r: 236, g: 111, b: 54, a: 1.0)
}
/// 折线图的圆点的外色
func YLineYYColor() -> UIColor {
    return YMColor(r: 246, g: 197163, b: 103, a: 1.0)
}

///灰色
func YHuiColor() -> UIColor {
    return YMColor(r: 185, g: 185, b: 185, a: 1.0)
}

extension UIImage {
    func drawTextInImage(qypkName: String)->UIImage {
        //开启图片上下文
        let userAccnum = UserDefaults.standard.string(forKey: userName)
        //获取当前时间
        let now = Date()
        
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        var currentTime = "\(dformatter.string(from: now))"
        
        
        UIGraphicsBeginImageContext(self.size)
        //图形重绘
        self.draw(in: CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height))
        //水印文字属性
        let att = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 60),NSAttributedStringKey.foregroundColor:UIColor.orange]
        
        //添加用户
        let userTxt = NSString(string: userAccnum!)
        let userSize =  userTxt.size(withAttributes: att)
        userTxt.draw(in: CGRect.init(x: 100, y: self.size.height-280, width: userSize.width, height: userSize.height), withAttributes: att)
        
        //添加企业和排口
        let qyTxt = NSString(string: qypkName)
        let qySize =  qyTxt.size(withAttributes: att)
        qyTxt.draw(in: CGRect.init(x: 100, y: self.size.height-180, width: qySize.width, height: qySize.height), withAttributes: att)
        
        //添加日期
        let dateTxt = NSString(string: currentTime)
        let dateSize =  dateTxt.size(withAttributes: att)
        //绘制文字
        dateTxt.draw(in: CGRect.init(x: 100, y: self.size.height-80, width: dateSize.width, height: dateSize.height), withAttributes: att)
        
        //从当前上下文获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        
        return image!
        
    }
}

