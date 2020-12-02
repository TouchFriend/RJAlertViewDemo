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
    [actionBtn setTitle:@"打开" forState:UIControlStateNormal];
    [actionBtn setBackgroundImage:[UIImage rj_imageWithColor:RJGrayColorAlpha(221.0, 1.0)] forState:UIControlStateHighlighted];
    [actionBtn addTarget:self action:@selector(actionBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Target

- (void)actionBtnClick {
    NSLog(@"点击");
}

@end
