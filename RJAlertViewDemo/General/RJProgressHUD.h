//
//  NJProgressHUD.h
//  Destination
//
//  Created by TouchWorld on 2018/10/29.
//  Copyright © 2018 Redirect. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD/SVProgressHUD.h>

typedef void (^RJProgressHUDDismissCompletion)(void);

NS_ASSUME_NONNULL_BEGIN

@interface RJProgressHUD : NSObject

+ (void)show;

+ (void)showInfoWithStatus:(NSString *)status;

+ (void)showWithStatus:(NSString *)message;

+ (void)dismiss;

+ (void)dismissWithDelay:(NSTimeInterval)interval;

+ (void)dismissWithDelay:(NSTimeInterval)interval completion:(RJProgressHUDDismissCompletion)completion;

+ (void)showError:(NSString *)errorInfo;

+ (void)showSuccess:(NSString *)info;

+ (void)showProgress:(float)progress status:(NSString *)status;

@end

NS_ASSUME_NONNULL_END
