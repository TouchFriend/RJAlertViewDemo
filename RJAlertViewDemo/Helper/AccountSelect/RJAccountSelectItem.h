//
//  RJAccountSelectItem.h
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2021/1/22.
//  Copyright © 2021 RJSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJAccountSelectItem : NSObject

/// 手机号
@property (nonatomic, copy) NSString *account;
/// cell高度
@property (nonatomic, assign) CGFloat cellHeight;



@end

NS_ASSUME_NONNULL_END
