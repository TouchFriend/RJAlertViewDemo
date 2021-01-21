//
//  RJMultipleAccountView.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2021/1/21.
//  Copyright © 2021 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJMultipleAccountView : UIView

/// 选中行
@property (nonatomic, assign, readonly) NSInteger phoneSelectedRow;

- (instancetype)initWithPhoneNumbers:(NSArray *)phoneNumbers;

/// 检测数据是否输入完毕
- (BOOL)checkDataInputCompleted;

/// 获取选中的手机号
- (NSString *_Nullable)selectedPhoneNumber;

@end

NS_ASSUME_NONNULL_END
