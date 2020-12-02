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
#import "RJAlertControllerActionItem.h"
#import "RJInterfaceActionVibrantSeparatorView.h"
#import "RJAlertControllerActionViewConst.h"

@interface RJAlertControllerInterfaceActionGroupView ()

/// 操作数据
@property (nonatomic, strong) NSArray<RJAlertControllerActionItem *> *actionItems;

@end

@implementation RJAlertControllerInterfaceActionGroupView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInit];
    }
        
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor clearColor];
    
    RJAlertControllerActionItem *item1 = [[RJAlertControllerActionItem alloc] init];
    RJAlertControllerActionItem *item2 = [[RJAlertControllerActionItem alloc] init];
    RJAlertControllerActionItem *item3 = [[RJAlertControllerActionItem alloc] init];
    self.actionItems = @[item1, item2, item3];
    
    UIView *bgView = [[UIView alloc] init];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 10.0;
    bgView.layer.masksToBounds = YES;
    
    [self setupContentView];
}

- (void)setupContentView {
    UIView *contentView = [[UIView alloc] init];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    RJInterfaceActionGroupHeaderScrollView *headerView = [[RJInterfaceActionGroupHeaderScrollView alloc] initWithTitle:@"title" message:@"message"];
    [contentView addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(contentView);
    }];
    
    if (self.actionItems.count > 0) {
        RJInterfaceActionVibrantSeparatorView *separatorView = [[RJInterfaceActionVibrantSeparatorView alloc] init];
        [contentView addSubview:separatorView];
        [separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(headerView.mas_bottom);
            make.left.right.mas_equalTo(contentView);
            make.height.mas_equalTo(RJAlertControllerSeparatorViewDefaultHeight);
        }];
        
        RJInterfaceActionRepresentationsSequenceView *actionView = [[RJInterfaceActionRepresentationsSequenceView alloc] initWithActionItems:self.actionItems];
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
