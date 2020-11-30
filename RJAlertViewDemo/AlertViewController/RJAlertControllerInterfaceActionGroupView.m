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
    RJInterfaceActionGroupHeaderScrollView *headerView = [[RJInterfaceActionGroupHeaderScrollView alloc] init];
    [self addSubview:headerView];
    headerView.backgroundColor = [UIColor blueColor];
    
    RJInterfaceActionRepresentationsSequenceView *actionView = [[RJInterfaceActionRepresentationsSequenceView alloc] init];
    [self addSubview:actionView];
    actionView.backgroundColor = [UIColor redColor];
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(actionView.mas_top);
    }];
    [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(44.0);
    }];
}


@end
