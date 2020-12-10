//
//  RJAlertControllerActionViewConst.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/1.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 操作按钮默认高度
UIKIT_EXTERN const CGFloat RJAlertControllerActionViewDefaultHeight;

/// 分割线默认高度
#define RJAlertControllerSeparatorViewDefaultHeight (alertControllerSeparatorViewDefaultHeightFunc())

static inline CGFloat alertControllerSeparatorViewDefaultHeightFunc() {
    if (@available(iOS 14.0, *)) {
        return 0.3333;
    } else {
        // Fallback on earlier versions
        return 0.5;
    }
}
