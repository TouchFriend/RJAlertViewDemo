//
//  RJVerifyCodeView.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/7.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJVerifyCodeView : UIView

- (instancetype)initWithPhoneNumbers:(NSArray *)phoneNumbers;

/// 检测数据是否输入完毕
- (BOOL)checkDataInputCompleted;

/// 获取选中的手机号
- (NSString *_Nullable)selectedPhoneNumber;

/// 获取验证码
- (NSString *_Nullable)getVerifyCode;

@end

NS_ASSUME_NONNULL_END
