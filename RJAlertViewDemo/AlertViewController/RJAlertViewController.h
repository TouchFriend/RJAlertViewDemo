//
//  RJAlertViewController.h
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/27.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface RJAlertViewController : UIViewController

/// 标题
@property (nullable, nonatomic, copy) NSString *title;
/// 消息
@property (nullable, nonatomic, copy) NSString *message;
/// 内容
@property (nonatomic, strong) UIView *contentView;
/// 操作
@property (nonatomic, readonly) NSArray<RJAlertAction *> *actions;

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

- (void)addAction:(RJAlertAction *)action;
- (void)addActions:(NSArray<RJAlertAction *> *)actions;

@end

NS_ASSUME_NONNULL_END
