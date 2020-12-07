//
//  RJAlertControllerInterfaceActionGroupView.h
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/30.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface RJAlertControllerInterfaceActionGroupView : UIView

+ (instancetype)viewWithTitle:(nullable NSString *)title message:(nullable NSString *)message contentView:(nullable UIView *)contentView actions:(NSArray<RJAlertAction *> *)actions;

@end

NS_ASSUME_NONNULL_END
