//
//  RJAlertViewConst.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/1.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#ifndef RJAlertViewConst_h
#define RJAlertViewConst_h

#import <UIKit/UIkit.h>

// RGB
#ifndef RJColor
#define RJColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
#endif

// RGBA
#ifndef RJColorAlpha
#define RJColorAlpha(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]
#endif

// gray
#ifndef RJGrayColor
#define RJGrayColor(n) RJColor(n, n, n)
#endif

// gray + alpha
#ifndef RJGrayColorAlpha
#define RJGrayColorAlpha(n, a) RJColorAlpha(n, n, n, a)
#endif

// 随机颜色
#ifndef RJRandomColor
#define RJRandomColor RJColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#endif

//日志输出
#ifndef RJLog
#ifdef DEBUG // 调试
#define RJLog(...) NSLog(__VA_ARGS__)
#else // 发布
#define RJLog(...)
#endif
#endif

#endif /* RJAlertViewConst_h */
