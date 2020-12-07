//
//  RJAlertAction.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/1.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJAlertAction : NSObject

/// 标题
@property (nullable, nonatomic, copy) NSString *title;
/// 处理闭包
@property (nonatomic, copy) void(^ __nullable handler)(RJAlertAction *action);

+ (instancetype)actionWithTitle:(nullable NSString *)title handler:(void (^ __nullable)(RJAlertAction *action))handler;

@end

NS_ASSUME_NONNULL_END
