//
//  RJMultipleAccountSelectView.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2021/1/21.
//  Copyright © 2021 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJMultipleAccountSelectView : UIView

/// 手机号
@property (nonatomic, strong) NSArray<NSString *> *phoneNumbers;
/// 选中行
@property (nonatomic, assign, readonly) NSInteger selectedRow;

/// 是否选中
- (BOOL)isSelected;

/// 获取选中的手机号
- (NSString *_Nullable)selectedPhoneNumber;

@end

NS_ASSUME_NONNULL_END
