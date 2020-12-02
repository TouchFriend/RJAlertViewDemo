//
//  RJMultipViewConstraintViewController.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/2.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJMultipViewConstraintViewController.h"
#import "RJAlertViewConst.h"
#import <Masonry/Masonry.h>

@interface RJMultipViewConstraintViewController ()

@end

@implementation RJMultipViewConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    BOOL temp1Flag = YES;
    BOOL temp2Flag = NO;
    BOOL temp3Flag = YES;
    
    UIView *contentView = [[UIView alloc] init];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(270.0);
    }];
    contentView.backgroundColor = [UIColor orangeColor];
    
    CGFloat firstViewTop = 30.0;
    UIView *lastView = contentView;
    
    if (temp1Flag) {
        UIView *temp1 = [self tempView];
        [contentView addSubview:temp1];
        [temp1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(contentView).mas_offset(firstViewTop);
            make.centerX.mas_equalTo(contentView);
            make.height.mas_equalTo(20.0);
            make.width.mas_equalTo(contentView);
        }];
        lastView = temp1;
    }
    
    if (temp2Flag) {
        CGFloat CGFloatTop = lastView != contentView ? 10.0 : firstViewTop;
        UIView *temp2 = [self tempView];
        [contentView addSubview:temp2];
        [temp2 mas_makeConstraints:^(MASConstraintMaker *make) {
            [self addTopConstraint:make lastView:lastView flag:lastView != contentView top:CGFloatTop];
            make.centerX.mas_equalTo(contentView);
            make.height.mas_equalTo(15.0);
            make.width.mas_equalTo(contentView);
        }];
        lastView = temp2;
    }
    
    if (temp3Flag) {
        CGFloat CGFloatTop = lastView != contentView ? 10.0 : firstViewTop;
        UIView *temp3 = [self tempView];
        [contentView addSubview:temp3];
        [temp3 mas_makeConstraints:^(MASConstraintMaker *make) {
            [self addTopConstraint:make lastView:lastView flag:lastView != contentView top:CGFloatTop];
            make.centerX.mas_equalTo(contentView);
            make.height.mas_equalTo(40.0);
            make.width.mas_equalTo(contentView);
        }];
        lastView = temp3;
    }
    
    if (lastView != contentView) {
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(lastView.mas_bottom).mas_offset(20.0);
        }];
    } else {
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.0);
        }];
    }
    
}

- (void)addTopConstraint:(MASConstraintMaker *)make lastView:(UIView *)lastView flag:(BOOL)flag top:(CGFloat)top {
    if (flag) {
        make.top.mas_equalTo(lastView.mas_bottom).mas_offset(top);
    } else {
        make.top.mas_equalTo(lastView.mas_top).mas_offset(top);
    }
}

- (UIView *)tempView {
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = RJRandomColor;
    return tempView;
}

@end
