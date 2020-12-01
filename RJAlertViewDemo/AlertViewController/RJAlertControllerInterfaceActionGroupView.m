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
    RJAlertControllerActionItem *item1 = [[RJAlertControllerActionItem alloc] init];
    RJAlertControllerActionItem *item2 = [[RJAlertControllerActionItem alloc] init];
    RJAlertControllerActionItem *item3 = [[RJAlertControllerActionItem alloc] init];
    self.actionItems = @[item1, item2, item3];
    
    RJInterfaceActionGroupHeaderScrollView *headerView = [[RJInterfaceActionGroupHeaderScrollView alloc] initWithTitle:@"" message:@"message"];
    [self addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
    }];
    headerView.backgroundColor = [UIColor blueColor];
    
    if (self.actionItems.count > 0) {
        RJInterfaceActionRepresentationsSequenceView *actionView = [[RJInterfaceActionRepresentationsSequenceView alloc] initWithActionItems:self.actionItems];
        [self addSubview:actionView];
        [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(headerView.mas_bottom);
            make.left.right.bottom.mas_equalTo(self);
        }];
        actionView.backgroundColor = [UIColor redColor];
    } else {
        [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-24.0);
        }];
    }
    
    
}


@end
