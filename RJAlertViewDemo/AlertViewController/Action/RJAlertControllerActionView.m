//
//  RJAlertControllerActionView.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/30.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJAlertControllerActionView.h"
#import <Masonry/Masonry.h>
#import "RJAlertViewConst.h"
#import "UIImage+RJAlertViewControllerAdd.h"
#import "RJAlertAction.h"

@interface RJAlertControllerActionView ()

/// 按钮
@property (nonatomic, weak) UIButton *actionBtn;

@end

@implementation RJAlertControllerActionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self addSubview:actionBtn];
    [actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    self.actionBtn = actionBtn;
    [actionBtn setTitle:@"打开" forState:UIControlStateNormal];
    [actionBtn setBackgroundImage:[UIImage rj_imageWithColor:RJGrayColorAlpha(221.0, 1.0)] forState:UIControlStateHighlighted];
    [actionBtn addTarget:self action:@selector(actionBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Private

- (UIViewController *)viewController {
    UIResponder *responder = self.nextResponder;
    UIViewController *viewController = nil;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            viewController = (UIViewController *)responder;
            break;
        }
        responder = responder.nextResponder;
    }
    return viewController;
}

#pragma mark - Target

- (void)actionBtnClick {
    if (self.action.handler) {
        self.action.handler(self.action);
    }
    
//    UIViewController *viewController = [self viewController];
//    if (viewController) {
//        [viewController dismissViewControllerAnimated:YES completion:nil];
//    }
}

#pragma mark - Property

- (void)setAction:(RJAlertAction *)action {
    _action = action;
    [self.actionBtn setTitle:action.title forState:UIControlStateNormal];
}

@end
