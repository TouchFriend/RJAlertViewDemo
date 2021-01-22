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
@property (nonatomic, assign, readonly) NSInteger accountSelectedRow;

- (instancetype)initWithAccounts:(NSArray *)accounts userName:(NSString *)userName;

/// 检测数据是否输入完毕
- (BOOL)checkDataInputCompleted;

/// 获取选中的账号
- (NSString *_Nullable)selectedAccount;

@end

NS_ASSUME_NONNULL_END
