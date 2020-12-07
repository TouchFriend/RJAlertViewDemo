//
//  RJAlertAction.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/1.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJAlertAction.h"

@implementation RJAlertAction

+ (instancetype)actionWithTitle:(NSString *)title handler:(void (^)(RJAlertAction * _Nonnull))handler {
    RJAlertAction *action = [[self alloc] init];
    action.title = title;
    action.handler = handler;
    return action;
}

@end
