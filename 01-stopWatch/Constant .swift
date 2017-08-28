//
//  Constant .swift
//  01-stopWatch
//
//  Created by 张延 on 2017/8/24.
//  Copyright © 2017年 com.CocoaLemon.www. All rights reserved.
//

import UIKit

let KWidth = UIScreen.main.bounds.width
let KHeight = UIScreen.main.bounds.height


/// 根据RGB生成颜色(格式为：22,22,22)
var gof_RGBColor: (CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}
