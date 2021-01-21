//
//  RJVerifyCodePhoneSelectView.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/8.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJVerifyCodePhoneSelectView : UIView

/// 手机号
@property (nonatomic, strong) NSArray<NSString *> *phoneNumbers;

/// 是否选中
- (BOOL)isSelected;

/// 获取选中的手机号
- (NSString *_Nullable)selectedPhoneNumber;

@end

NS_ASSUME_NONNULL_END
