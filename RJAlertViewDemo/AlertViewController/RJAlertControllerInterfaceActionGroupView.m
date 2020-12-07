//
//  RJAlertControllerInterfaceActionGroupView.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/30.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJAlertControllerInterfaceActionGroupView.h"
#import "RJInterfaceActionGroupHeaderScrollView.h"
#import "RJInterfaceActionRepresentationsSequenceView.h"
#import <Masonry/Masonry.h>
#import "RJAlertAction.h"
#import "RJInterfaceActionVibrantSeparatorView.h"
#import "RJAlertControllerActionViewConst.h"

@interface RJAlertControllerInterfaceActionGroupView ()

/// 标题
@property (nullable, nonatomic, copy) NSString *title;
/// 消息
@property (nullable, nonatomic, copy) NSString *message;
/// 内容
@property (nonatomic, strong) UIView *contentView;
/// 操作数据
@property (nonatomic, strong) NSArray<RJAlertAction *> *actions;

@end

@implementation RJAlertControllerInterfaceActionGroupView

#pragma mark - Init

+ (instancetype)viewWithTitle:(NSString *)title message:(NSString *)message contentView:(UIView *)contentView actions:(NSArray<RJAlertAction *> *)actions {
    RJAlertControllerInterfaceActionGroupView *groupView = [[self alloc] init];
    groupView.title = title;
    groupView.message = message;
    groupView.contentView = contentView;
    groupView.actions = actions;
    [groupView setupInit];
    return groupView;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 10.0;
    self.layer.masksToBounds = YES;
    
    [self setupContentView];
}

- (void)setupContentView {
    UIView *contentView = [[UIView alloc] init];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    RJInterfaceActionGroupHeaderScrollView *headerView = [[RJInterfaceActionGroupHeaderScrollView alloc] initWithTitle:self.title message:self.message];
    [contentView addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(contentView);
    }];
    
    if (self.actions.count > 0) {
        RJInterfaceActionVibrantSeparatorView *separatorView = [[RJInterfaceActionVibrantSeparatorView alloc] init];
        [contentView addSubview:separatorView];
        [separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(headerView.mas_bottom);
            make.left.right.mas_equalTo(contentView);
            make.height.mas_equalTo(RJAlertControllerSeparatorViewDefaultHeight);
        }];
        
        RJInterfaceActionRepresentationsSequenceView *actionView = [[RJInterfaceActionRepresentationsSequenceView alloc] initWithActions:self.actions];
        [contentView addSubview:actionView];
        [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(separatorView.mas_bottom);
            make.left.right.bottom.mas_equalTo(contentView);
        }];
    } else {
        [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(contentView.mas_bottom);
        }];
    }
}


@end
