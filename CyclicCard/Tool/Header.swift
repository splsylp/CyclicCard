//
//  Header.swift
//  HuiKaoBa
//
//  Created by Tony on 16/11/17.
//  Copyright © 2016年 Tony. All rights reserved.
//

import UIKit

/** 屏幕尺寸 */

// 屏幕宽度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
// 屏幕高度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
// 自适应屏幕宽度
func FIT_SCREEN_WIDTH(_ size: CGFloat) -> CGFloat {
    return size * SCREEN_WIDTH / 375.0
}
// 自适应屏幕高度
func FIT_SCREEN_HEIGHT(_ size: CGFloat) -> CGFloat {
    return size * SCREEN_HEIGHT / 667.0
}
// 自适应屏幕字体大小
func AUTO_FONT(_ size: CGFloat) -> UIFont {
    let autoSize = size * SCREEN_WIDTH / 375.0
    return UIFont.systemFont(ofSize: autoSize)
}


/** 颜色值 */
// RGB颜色
func RGB_COLOR(_ r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
}
// 项目主颜色
func MAIN_COLOR() -> UIColor {
    return UIColor(red: 74/255.0, green: 163/255.0, blue: 243/255.0, alpha: 1.0)
}

/** 一级文字颜色 */
func Font_Color_First() -> UIColor {
    return UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
}

/** 二级文字颜色 */
func Font_Color_Second() -> UIColor {
    return UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
}
/** 三级文字颜色 */
func Font_Color_Third() -> UIColor {
    return UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)
}

/** 分割线颜色 */
func Line_COLOR() -> UIColor {
    return UIColor(red: 221.0/255.0, green: 221.0/255.0, blue: 221.0/255.0, alpha: 1.0)
}

// 灰色背景
func GRAY_COLOR() -> UIColor {
    return UIColor(red: 242/255.0, green: 243/255.0, blue: 248/255.0, alpha: 1.0)
}





