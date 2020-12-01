//
//  RJInterfaceActionSeparatableSequenceView.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/30.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJInterfaceActionSeparatableSequenceView.h"
#import <Masonry/Masonry.h>
#import "RJAlertControllerActionView.h"
#import "RJInterfaceActionVibrantSeparatorView.h"
#import "RJAlertControllerActionItem.h"
#import "RJAlertViewConst.h"
#import "RJAlertControllerActionViewConst.h"

@interface RJInterfaceActionSeparatableSequenceView ()

/// 操作
@property (nonatomic, strong) NSArray<RJAlertControllerActionView *> *actionViews;
/// 分割线
@property (nonatomic, strong) NSArray<RJInterfaceActionVibrantSeparatorView *> *separatorViews;
/// 排序view
@property (nonatomic, strong) NSArray<__kindof UIView *> *arrangedSubviews;
/// stackView
@property (nonatomic, weak) UIStackView *stackView;
/// <#Desription#>
@property (nonatomic, assign, getter=isVertical) BOOL vertical;


@end

@implementation RJInterfaceActionSeparatableSequenceView

- (instancetype)initWithActionItems:(NSArray *)actionItems {
    self = [super init];
    if (self) {
        self.actionItems = actionItems;
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor whiteColor];
    self.vertical = self.actionViews.count > 2;
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:self.arrangedSubviews];
    [self addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    self.stackView = stackView;
    stackView.axis = self.vertical ? UILayoutConstraintAxisVertical :  UILayoutConstraintAxisHorizontal;
    stackView.backgroundColor = [UIColor systemPinkColor];
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 0.0;
    if (self.actionViews.count > 1) {
        NSMutableArray *arr = [NSMutableArray arrayWithArray:self.actionViews];
        [arr removeObjectAtIndex:0];
        [arr mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self.isVertical) {
                make.height.mas_equalTo(self.actionViews.firstObject);
            } else {
                make.width.mas_equalTo(self.actionViews.firstObject);
            }
        }];
    }
}

#pragma mark - Property

- (NSArray<RJAlertControllerActionView *> *)actionViews {
    if (!_actionViews) {
        NSMutableArray *actions = [NSMutableArray array];
        for (RJAlertControllerActionItem *item in self.actionItems) {
            RJAlertControllerActionView *actionView = [[RJAlertControllerActionView alloc] init];
            actionView.backgroundColor = RJRandomColor;
            [actions addObject:actionView];
        }
        _actionViews = [actions copy];
    }
    return _actionViews;
}

- (NSArray<RJInterfaceActionVibrantSeparatorView *> *)separatorViews {
    if (!_separatorViews) {
        if (!self.actionViews || self.actionViews.count <= 1) {
            _separatorViews = [NSArray array];
            return _separatorViews;
        }
        
        NSMutableArray *views = [NSMutableArray array];
        NSInteger count = self.actionViews.count - 1;
        for (NSInteger i = 0; i < count; i++) {
            RJInterfaceActionVibrantSeparatorView *separatorView = [[RJInterfaceActionVibrantSeparatorView alloc] init];
            [separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
                if (self.vertical) {
                    make.height.mas_equalTo(RJAlertControllerSeparatorViewDefaultHeight);
                } else {
                    make.width.mas_equalTo(RJAlertControllerSeparatorViewDefaultHeight);
                }
            }];
            // 179 154 131
            separatorView.backgroundColor = RJColor(179.0, 154.0, 131.0);
            [views addObject:separatorView];
        }
        _separatorViews = [views copy];
    }
    return _separatorViews;
}

- (NSArray<__kindof UIView *> *)arrangedSubviews {
    if (!_arrangedSubviews) {
        if (!self.actionViews || self.actionViews.count == 0) {
            _arrangedSubviews = [NSArray array];
            return _arrangedSubviews;
        }
        
        NSMutableArray *subViews = [NSMutableArray array];
        for (NSInteger i = 0; i < self.actionViews.count; i++) {
            RJAlertControllerActionView *actionView = self.actionViews[i];
            [subViews addObject:actionView];
            if (i < self.separatorViews.count) {
                RJInterfaceActionVibrantSeparatorView *separatorView = self.separatorViews[i];
                [subViews addObject:separatorView];
            }
        }
        _arrangedSubviews = [subViews copy];
        
    }
    return _arrangedSubviews;
}

@end
