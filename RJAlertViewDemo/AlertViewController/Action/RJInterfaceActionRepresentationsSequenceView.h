//
//  RJInterfaceActionRepresentationsSequenceView.h
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/30.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJAlertAction;

NS_ASSUME_NONNULL_BEGIN

@interface RJInterfaceActionRepresentationsSequenceView : UIScrollView

/// 操作数据
@property (nonatomic, strong) NSArray<RJAlertAction *> *actions;

- (instancetype)initWithActions:(NSArray *)actions;

@end

NS_ASSUME_NONNULL_END
