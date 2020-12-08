//
//  RJInterfaceActionGroupHeaderScrollView.h
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/30.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJInterfaceActionGroupHeaderScrollView : UIScrollView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message contentView:(UIView *)contentView;

@end

NS_ASSUME_NONNULL_END
